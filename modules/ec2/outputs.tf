output "instance_type" {
  value = aws_instance.ec2.instance_type
}

output "instance_name" {
  value = aws_instance.ec2.tags.Name
}

output "key_name" {
  value = aws_instance.ec2.key_name
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}

output "public_ip" {
  value = aws_instance.ec2.public_ip != "" ? aws_instance.ec2.public_ip : "this instance doesn't have a public ip!"
}