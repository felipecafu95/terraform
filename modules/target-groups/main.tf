data "aws_lb" "my_existing_lb" {
      name  = "${var.lb_name}"
}

data "aws_route53_zone" "my_existing_zone" {
      name           = "${var.zone_name}"
      private_zone   = "false"
}

data "aws_lb_listener" "my_existing_listener80" {
  load_balancer_arn = "${data.aws_lb.my_existing_lb.arn}"
  port              = 80
}
data "aws_lb_listener" "my_existing_listener443" {
  load_balancer_arn = "${data.aws_lb.my_existing_lb.arn}"
  port              = 443
}
resource "aws_lb_target_group" "generic-tg" {
  name                     = "${var.tg_name}"
  port                     = "${var.port}"
  protocol                 = "${var.protocol}"
  vpc_id                   = "${var.vpc_id}"
  deregistration_delay     = "${var.deregistration_delay}"
  slow_start               = "${var.slow_start}"
}

resource "aws_lb_listener_rule" "generic-lb-rule" {
  listener_arn = "${data.aws_lb_listener.my_existing_listener443.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.generic-tg.arn}"
  }
  condition {
    field  = "${var.field}"
    values = ["${var.values}"]
  }
}
resource "aws_lb_listener_rule" "redirect_http_to_https" {
  listener_arn = "${data.aws_lb_listener.my_existing_listener80.arn}"

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    field  = "${var.field}"
    values = ["${var.values}"]
  }
}
resource "aws_route53_record" "alias-record" {
  zone_id = "${data.aws_route53_zone.my_existing_zone.zone_id}"
  name    = "${var.record_name}"
  type    = "A"

  alias {
    name                   = "${data.aws_lb.my_existing_lb.dns_name}"
    zone_id                = "${data.aws_lb.my_existing_lb.zone_id}"
    evaluate_target_health = true
  }
}