output "role_name" {
  value = "${aws_iam_role.generic_role.name}"
}

output "policy_name" {
  value = "${aws_iam_policy.generic_policy.name}"
}

output "policy_arn" {
  value = "${aws_iam_policy_attachment.generic_attach.policy_arn}"
}
output "profile_name" {
  value = "${aws_iam_instance_profile.generic_profile.name}"
}
output "instance_profile" {
  value = "${aws_iam_instance_profile.generic_profile.arn}"
}
