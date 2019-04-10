resource "aws_lb" "generic-lb" {
  name               = "${var.name}"
  internal           = "${var.internal}"
  load_balancer_type = "${var.type}"
  security_groups    = ["${var.security_groups}"]
  subnets            = ["${var.subnets}"]

  enable_deletion_protection = "${var.deletion_protection}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${var.tag_name}"
  }
}

resource "aws_lb_target_group" "generic-tg" {
  name     = "${var.tg_name}"
  port     = "${var.port}"
  protocol = "${var.protocol}"
  vpc_id   = "${var.vpc_id}"
  deregistration_delay = "${var.deregistration_delay}"
  slow_start = "${var.slow_start}"

}

resource "aws_lb_listener" "generic-lb_listener" {
  load_balancer_arn = "${aws_lb.generic-lb.arn}"
  port              = "${var.listener-port}"
  protocol          = "${var.listener-protocol}"

  default_action {
    order            = 2
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.generic-tg.arn}"
  }
}