##################################################################
# DATABASE
##################################################################
resource "aws_subnet" "database" {
  count                   = length(split(",", lookup(var.azs, var.region)))
  vpc_id                  = aws_vpc.main.id
  availability_zone       = element(split(",", lookup(var.azs, var.region)), count.index)
  cidr_block              = cidrsubnet(var.vpc_cidr, 10, count.index)
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Database-0${count.index + 1}"
    Type = "Database"
  }
}

##################################################################
# PRIVATE
##################################################################
resource "aws_subnet" "private" {
  count                   = length(split(",", lookup(var.azs, var.region)))
  vpc_id                  = aws_vpc.main.id
  availability_zone       = element(split(",", lookup(var.azs, var.region)), count.index)
  cidr_block              = cidrsubnet(var.vpc_cidr, 7, count.index + 1)
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Private-0${count.index + 1}"
    Type = "Private"
  }
}

##################################################################
# PUBLIC
##################################################################
resource "aws_subnet" "public" {
  count                   = length(split(",", lookup(var.azs, var.region)))
  vpc_id                  = aws_vpc.main.id
  availability_zone       = element(split(",", lookup(var.azs, var.region)), count.index)
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index + 10)
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public-0${count.index + 1}"
    Type = "Public"
  }
}

##################################################################
# EKS
##################################################################
resource "aws_subnet" "eks_private" {
  count                   = var.eks_subnet && length(split(",", lookup(var.azs, var.region))) > 0 ? length(split(",", lookup(var.azs, var.region))) : 0
  vpc_id                  = aws_vpc.main.id
  availability_zone       = element(split(",", lookup(var.azs, var.region)), count.index)
  cidr_block              = cidrsubnet(var.vpc_cidr, 3, count.index + 1)
  map_public_ip_on_launch = "false"

  tags = {
    Name    = "EKS-Private-0${count.index + 1}"
    Type    = "EKS"
    Private = "true"
  }
}

resource "aws_subnet" "eks_public" {
  count                   = var.eks_subnet && length(split(",", lookup(var.azs, var.region))) > 0 ? length(split(",", lookup(var.azs, var.region))) : 0
  vpc_id                  = aws_vpc.main.id
  availability_zone       = element(split(",", lookup(var.azs, var.region)), count.index)
  cidr_block              = cidrsubnet(var.vpc_cidr, 3, count.index + 4)
  map_public_ip_on_launch = "true"

  tags = {
    Name    = "EKS-Public-0${count.index + 1}"
    Type    = "EKS"
    Private = "false"
  }
}