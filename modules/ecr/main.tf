provider "aws" {
  region = "ap-south-1"
}

resource "aws_ecr_repository" "repo" {
  name = var.repository_name
}

output "ecr_repo_url" {
  value = aws_ecr_repository.repo.repository_url
}
