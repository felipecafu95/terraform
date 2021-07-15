resource "aws_eip" "nat" {
  count = var.single_nat_gateway ? 1 : length(split(",", lookup(var.azs, var.region)))
  vpc   = true
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "${var.vpc_name}-0${count.index + 1}"
  }
}

resource "aws_nat_gateway" "main" {
  count         = var.single_nat_gateway ? 1 : length(split(",", lookup(var.azs, var.region)))
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = {
    Name = "${var.vpc_name}-0${count.index + 1}"
  }
  depends_on = [aws_internet_gateway.main]
}