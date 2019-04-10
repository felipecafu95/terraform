output "instance_type" {
  value = "${aws_instance.generic_ec2.instance_type}"
}

output "instance_name" {
  value = "${aws_instance.generic_ec2.tags.Name}"
}

output "key_name" {
  value = "${aws_instance.generic_ec2.key_name}"
}

output "private_ip" {
  value = "${aws_instance.generic_ec2.private_ip}"
}
