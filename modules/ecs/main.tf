provider "aws" {
  region = "ap-south-1"
}
resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.cluster.name
}
