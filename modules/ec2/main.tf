
resource "aws_instance" "generic_ec2" {
  ami                       = "${var.ami}"
  instance_type             = "${var.instance_type}"
  key_name                  = "${var.key_name}"
  security_groups           = ["${var.sg_ids}"]
  subnet_id                 = "${var.subnet_id}"
  tenancy                   = "${var.tenancy}"
  user_data                 = "${var.user_data}"
  iam_instance_profile      = "${var.iam_instance_profile}"


  root_block_device {
    volume_type = "${var.volume_type}"
    volume_size = "${var.volume_size}"
    delete_on_termination = "true"
  }

  tags {
    Name = "${var.instance_name}"
  }

  tags {
    Env = "${var.environment}"
  }

}


