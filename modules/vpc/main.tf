resource "aws_vpc" "generic_vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "${var.vpc_name}"
  }
}

/* Subnet publica */
resource "aws_subnet" "generic_pub_subnet" {
  count                   = "${length(split(",", lookup(var.azs, var.region)))}"
  vpc_id                  = "${aws_vpc.generic_vpc.id}"
  cidr_block              = "${cidrsubnet("${var.vpc_cidr}", 3, count.index +3)}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.pub_subnet_name}-${element(split(",", lookup(var.azs, var.region)), count.index)}"
  }
}

resource "aws_internet_gateway" "generic_igw" {
  vpc_id = "${aws_vpc.generic_vpc.id}"

  tags = {
    Name = "${var.igw_name}"
  }
}

resource "aws_eip" "nat" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "generic_ngw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${element(aws_subnet.generic_pub_subnet.*.id, count.index)}"

  tags = {
    Name = "${var.ngw_name}"
  }
}

resource "aws_route_table" "generic_rtb_pub" {
  vpc_id = "${aws_vpc.generic_vpc.id}"

  route {
    cidr_block = "${var.rtb_pub_cidr}"
    gateway_id = "${aws_internet_gateway.generic_igw.id}"
  }

  tags = {
    Name = "${var.rtb_pub_name}"
  }
}

resource "aws_route_table_association" "generic_rta_pub" {
  count          = "${length(split(",", lookup(var.azs, var.region)))}"
  subnet_id      = "${element(aws_subnet.generic_pub_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.generic_rtb_pub.id}"
}

/* Subnet privada */
resource "aws_subnet" "generic_pvt_subnet" {
  count                   = "${length(split(",", lookup(var.azs, var.region)))}"
  vpc_id                  = "${aws_vpc.generic_vpc.id}"
  cidr_block              = "${cidrsubnet("${var.vpc_cidr}", 3, count.index +1)}"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "${var.pvt_subnet_name}-${element(split(",", lookup(var.azs, var.region)), count.index)}"
  }
}

resource "aws_route_table" "generic_rtb_pvt" {
  vpc_id = "${aws_vpc.generic_vpc.id}"

  route {
    cidr_block     = "${var.rtb_pvt_cidr}"
    nat_gateway_id = "${aws_nat_gateway.generic_ngw.id}"
  }

  # route {
  #   cidr_block               = "${var.peering_routes}"
  #   vpc_peering_connection_id = "${var.peering_id}"
  # }

  tags = {
    Name = "${var.rtb_pvt_name}"
  }
}

resource "aws_route_table_association" "generic_rta_pvt" {
  count          = "${length(split(",", lookup(var.azs, var.region)))}"
  subnet_id      = "${element(aws_subnet.generic_pvt_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.generic_rtb_pvt.id}"
}

/* Subnet privada para RDS */
resource "aws_subnet" "generic_db_pvt_subnet" {
  count                   = "${length(split(",", lookup(var.azs, var.region)))}"
  vpc_id                  = "${aws_vpc.generic_vpc.id}"
  cidr_block              = "${cidrsubnet("${var.vpc_cidr}", 3, count.index +5)}"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "${var.db_pvt_subnet_name}-${element(split(",", lookup(var.azs, var.region)), count.index)}"
  }
}

resource "aws_route_table" "generic_rtb_pvt-db" {
  vpc_id = "${aws_vpc.generic_vpc.id}"

  route {
    cidr_block     = "${var.rtb_pvt-db_cidr}"
    nat_gateway_id = "${aws_nat_gateway.generic_ngw.id}"
  }

  # route {
  #   cidr_block               = "${var.peering_routes}"
  #   vpc_peering_connection_id = "${var.peering_id}"
  # }

  tags = {
    Name = "${var.rtb_pvt-db_name}"
  }
}

resource "aws_route_table_association" "generic_rta_pvt-db" {
  count          = "${length(split(",", lookup(var.azs, var.region)))}"
  subnet_id      = "${element(aws_subnet.generic_db_pvt_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.generic_rtb_pvt-db.id}"
}
