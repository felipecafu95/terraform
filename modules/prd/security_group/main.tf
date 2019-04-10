resource "aws_security_group" "generic_sg" {
  name        = "${var.sg_name}"
  description = "${var.sg_description}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "${var.ing_from-port}"
    to_port     = "${var.ing_to-port}"
    protocol    = "${var.ing_protocol}"
    cidr_blocks = ["${var.ing_cidr-blocks}"]
  }

  egress {
    from_port   = "${var.eg_from-port}"
    to_port     = "${var.eg_to-port}"
    protocol    = "${var.eg_protocol}"
    cidr_blocks = ["${var.eg_cidr-blocks}"]
  }
}