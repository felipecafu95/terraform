output "key_name" {
  value = module.key_pair.key_name
}

output "fingerprint" {
  value = module.key_pair.fingerprint
}

output "instance_type" {
  value = module.ec2.instance_type
}


output "private_ip" {
  value = module.ec2.private_ip
}

output "public_ip" {
  value = module.ec2.public_ip
}