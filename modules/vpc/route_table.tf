##################################################################
# PUBLIC
##################################################################
resource "aws_route_table" "public" {
  count  = var.create_vpc ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Public"
  }
}

resource "aws_route_table_association" "public" {
  count          = var.create_vpc ? length(split(",", lookup(var.azs, var.region))) : 0
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id, count.index)
}

resource "aws_route" "public" {
  count                  = var.create_vpc ? length(split(",", lookup(var.azs, var.region))) : 0
  route_table_id         = element(aws_route_table.public.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = element(aws_internet_gateway.main.*.id, 1)
  depends_on             = [aws_route_table.public]
}

##################################################################
# PRIVATE
##################################################################
resource "aws_route_table" "private" {
  count  = var.create_vpc ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Private"
  }
}

resource "aws_route_table_association" "private" {
  count          = var.create_vpc ? length(split(",", lookup(var.azs, var.region))) : 0
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

resource "aws_route" "private" {
  count                  = var.create_vpc ? 1 : 0
  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.main.*.id, count.index)
  depends_on = [
    aws_route_table.database,
    aws_nat_gateway.main
  ]
}


##################################################################
# DATABASE
##################################################################
resource "aws_route_table" "database" {
  count  = var.create_vpc ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Database"
  }
}

resource "aws_route_table_association" "database" {
  count          = var.create_vpc ? length(split(",", lookup(var.azs, var.region))) : 0
  subnet_id      = element(aws_subnet.database.*.id, count.index)
  route_table_id = element(aws_route_table.database.*.id, count.index)
}

resource "aws_route" "database" {
  count                  = var.create_vpc ? 1 : 0
  route_table_id         = element(aws_route_table.database.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.main.*.id, count.index)
  depends_on = [
    aws_route_table.database,
    aws_nat_gateway.main
  ]
}

# ##################################################################
# # EKS
# ##################################################################
resource "aws_route_table" "eks_private" {
  count  = var.create_vpc && var.eks_subnet ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "EKS-Private"
  }
}
resource "aws_route_table_association" "eks_private" {
  count          = var.create_vpc && var.eks_subnet ? length(split(",", lookup(var.azs, var.region))) : 0
  subnet_id      = element(aws_subnet.eks_private.*.id, count.index)
  route_table_id = element(aws_route_table.eks_private.*.id, count.index)
}

resource "aws_route" "eks_private" {
  count                  = var.create_vpc && var.eks_subnet ? 1 : 0
  route_table_id         = element(aws_route_table.eks_private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.main.*.id, count.index)
  depends_on             = [aws_route_table.eks_private]
}

resource "aws_route_table" "eks_public" {
  count  = var.create_vpc && var.eks_subnet ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "EKS-Public"
  }
}
resource "aws_route_table_association" "eks_public" {
  count          = var.create_vpc && var.eks_subnet ? length(split(",", lookup(var.azs, var.region))) : 0
  subnet_id      = element(aws_subnet.eks_public.*.id, count.index)
  route_table_id = element(aws_route_table.eks_public.*.id, count.index)
}

resource "aws_route" "eks_public" {
  count                  = var.create_vpc && var.eks_subnet ? 1 : 0
  route_table_id         = element(aws_route_table.eks_public.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
  depends_on             = [aws_route_table.eks_public]
}