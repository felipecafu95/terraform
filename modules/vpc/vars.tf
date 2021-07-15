variable "region" {
  type    = string
  default = "us-east-1"
}

variable "azs" {
  type = map(string)
  default = {
    us-east-1 = "us-east-1a,us-east-1b,us-east-1c"
  }
}
variable "create_vpc" {
  default = true
}

variable "single_nat_gateway" {
  default = true
}

variable "eks_subnet" {
  default = false
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "Terraform"
}

variable "project" {
  type    = string
  default = "Lab"
}