output "arn" {
  value = "${aws_lb_target_group.generic-tg.arn}"
}

output "id" {
  value = "${aws_lb_target_group.generic-tg.id}"
}
output "dns_record" {
  value = "${aws_route53_record.alias-record.fqdn}"
}
