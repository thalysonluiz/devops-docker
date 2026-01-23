resource "aws_ecr_repository" "thalysonluiz-ci-api" {
  name                 = "thalysonluiz-ci"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    IAC = "True"
  }
}