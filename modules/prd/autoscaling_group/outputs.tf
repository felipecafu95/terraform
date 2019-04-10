output "image_id" {
  value = "${aws_launch_configuration.launch_configuration.image_id}"
}

output "instance_type" {
  value = "${aws_launch_configuration.launch_configuration.instance_type}"
}

output "instance_name" {
  value = "${aws_autoscaling_group.autoscaling_group.tags.0}"
}

output "env" {
  value = "${aws_autoscaling_group.autoscaling_group.tags.1}"
}
