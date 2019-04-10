resource "aws_ecr_repository" "repository" {
  name = "${var.ecr_name}"
}