/* Criação do repositório de imagens */
resource "aws_ecr_repository" "repository" {
  name = "${var.ecr_name}"
}

resource "aws_ecr_lifecycle_policy" "policy" {
  repository = "${var.repository}"

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 10,
            "description": "Keep the last 5 images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 5
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}