provider "aws" {
  region = "ap-south-1"
}

data "aws_ecr_repository" "repo" {
  name = var.ecr_repo_name
}

data "aws_ecr_image" "latest_image" {
  repository_name = data.aws_ecr_repository.repo.name
  most_recent     = true
}

resource "aws_ecs_task_definition" "task" {
  family                   = var.task_family
  container_definitions    = jsonencode([{
    name        = var.container_name
    image       = data.aws_ecr_image.latest_image.image_uri
    memory      = var.container_memory
    cpu         = var.container_cpu
    essential   = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
      protocol      = "tcp"
    }]
    healthCheck  = {
      command     = ["CMD-SHELL", "curl -f http://localhost:80/ || exit 1"]
      interval    = 30
      timeout     = 5
      retries     = 3
      startPeriod = 10
    }
  }])

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
  cpu                      = var.task_cpu
  memory                   = var.task_memory
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.task.arn
}
