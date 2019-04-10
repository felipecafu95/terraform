output "id" {
  value = "${aws_lb.generic-lb.id}"
}

output "arn" {
  value = "${aws_lb.generic-lb.arn}"
}

output "tag_name" {
  value = "${aws_lb.generic-lb.tags["Name"]}"
}

output "tag_env" {
  value = "${aws_lb.generic-lb.tags["Environment"]}"
}
