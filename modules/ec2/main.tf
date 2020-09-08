data "aws_ami" "amazon" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*.*-x86_64-gp2"]
  }
} 

resource "aws_instance" "ec2" {
  ami                  = data.aws_ami.amazon.id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_groups      = var.sg_ids
  subnet_id            = var.subnet_id
  user_data            = var.user_data
  iam_instance_profile = var.iam_instance_profile

  root_block_device {
    volume_size           = var.volume_size
    delete_on_termination = "true"
  }

  tags = {
    Name = var.instance_name
    Enviroment = var.environment
    OS_Type = var.os
    Creation_Time = timestamp()
  }

}