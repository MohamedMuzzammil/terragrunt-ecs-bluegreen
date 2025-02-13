# CodeDeploy Application Variables
variable "codedeploy_application_name" {
  description = "Name of the CodeDeploy application"
  type        = string
}

variable "compute_platform" {
  description = "Compute platform for the CodeDeploy application (e.g., ECS)"
  type        = string
  default     = "ECS"
}

# CodeDeploy Deployment Group Variables
variable "codedeploy_deployment_group_name" {
  description = "Name of the CodeDeploy deployment group"
  type        = string
}

variable "codedeploy_service_role_arn" {
  description = "IAM role ARN used by CodeDeploy for deployments"
  type        = string
  sensitive   = true
}


variable "deployment_config_name" {
  description = "Deployment configuration for CodeDeploy (e.g., CodeDeployDefault.ECSAllAtOnce)"
  type        = string
  default     = "CodeDeployDefault.ECSAllAtOnce"
}

variable "terminate_blue_on_success" {
  description = "Flag to determine whether to terminate the blue instances on deployment success"
  type        = bool
  default     = true
}

variable "termination_wait_time_minutes" {
  description = "Wait time in minutes before terminating blue instances"
  type        = number
  default     = 5
}

//variable "wait_time_minutes" {
  //description = "Wait time in minutes for deployment to be ready"
  //type        = number
  //default     = 1
//}

variable "continue_on_timeout" {
  description = "Flag to determine whether to continue deployment on timeout"
  type        = bool
  default     = true
}
variable "deployment_group_name" {
  description = "Name of the CodeDeploy deployment group"
  type        = string
}

# ECS Service Reference Variables
variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

# Load Balancer Variables
variable "prod_listener_arns" {
  description = "List of ARNs for production listeners"
  type        = list(string)
}

//variable "test_listener_arns" {
 // description = "List of ARNs for test listeners"
  //type        = list(string)
//}

variable "blue_target_group_name" {
  description = "Name of the blue target group"
  type        = string
}

variable "green_target_group_name" {
  description = "Name of the green target group"
  type        = string
}

# Tags
variable "tags" {
  description = "Tags to associate with the CodeDeploy resources"
  type        = map(string)
  default     = {}
}
