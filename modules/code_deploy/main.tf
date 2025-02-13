provider "aws" {
  region = var.aws_region
}

resource "aws_codedeploy_app" "ecs_app" {
  compute_platform = var.compute_platform
  name             = var.codedeploy_application_name
}

resource "aws_codedeploy_deployment_group" "ecs_deployment_group" {
  app_name               = aws_codedeploy_app.ecs_app.name
  deployment_config_name = var.deployment_config_name
  deployment_group_name  = var.deployment_group_name
  service_role_arn       = "arn:aws:iam::<AWS_ACCOUNT_ID>:role/<CODEDEPLOY_ROLE>" # Placeholder

  deployment_style {
    deployment_type   = "BLUE_GREEN"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

  blue_green_deployment_config {
    terminate_blue_instances_on_deployment_success {
      action                         = var.terminate_blue_on_success ? "TERMINATE" : "KEEP_ALIVE"
      termination_wait_time_in_minutes = var.termination_wait_time_minutes
    }
    deployment_ready_option {
      action_on_timeout = var.continue_on_timeout ? "CONTINUE_DEPLOYMENT" : "STOP_DEPLOYMENT"
    }
  }

  ecs_service {
    cluster_name = "<ECS_CLUSTER_NAME>" # Placeholder
    service_name = "<ECS_SERVICE_NAME>" # Placeholder
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = ["arn:aws:elasticloadbalancing:<REGION>:<AWS_ACCOUNT_ID>:listener/<LISTENER_ID>"] # Placeholder
      }
      target_group {
        name = "<BLUE_TARGET_GROUP>" # Placeholder
      }
      target_group {
        name = "<GREEN_TARGET_GROUP>" # Placeholder
      }
    }
  }

  tags = var.tags
}

# Secure outputs
output "codedeploy_app_name" {
  value       = aws_codedeploy_app.ecs_app.name
  description = "The name of the CodeDeploy application"
  sensitive   = true # Hides the value in Terraform outputs
}

output "codedeploy_deployment_group_id" {
  value       = aws_codedeploy_deployment_group.ecs_deployment_group.id
  description = "The ID of the CodeDeploy deployment group"
  sensitive   = true # Hides the value in Terraform outputs
}
