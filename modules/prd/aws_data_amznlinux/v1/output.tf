/*
VR Beneficios - 2018
Author: Raphael Rabelo de Oliveira
Email: raphael@rabeloo.com.br

module: aws_ami
References: https://www.terraform.io/docs/providers/aws/d/ami.html
*/

output "ami_id" {
 value = "${data.aws_ami.amzn_linux.id}" 
}
