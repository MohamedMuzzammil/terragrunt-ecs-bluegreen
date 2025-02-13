provider "aws" {
  region = "ap-south-1"
}

# ECS Service
resource "aws_ecs_service" "fargate_service" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = var.task_definition_arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = var.assign_public_ip
  }

  load_balancer {
    target_group_arn = var.blue_target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  tags = var.tags
}

# Outputs
output "service_name" {
  value = aws_ecs_service.fargate_service.name
}
