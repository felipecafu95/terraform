/*
VR Beneficios - 2018
Author: Raphael Rabelo de Oliveira
Email: raphael@rabeloo.com.br

module: aws_ami
References: https://www.terraform.io/docs/providers/aws/d/ami.html
*/

data "aws_ami" "amzn_linux" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*gp2*"]
  }
}
