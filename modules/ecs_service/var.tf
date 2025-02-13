variable "service_name" {
  description = "The name of the ECS service"
  default     = "terragrunt-service"
}

variable "cluster_id" {
  description = "The ECS cluster ID or ARN"
}

variable "task_definition_arn" {
  description = "The ARN of the task definition to use"
}

variable "desired_count" {
  description = "The desired number of tasks"
  default     = 1
}

variable "subnets" {
  description = "List of subnet IDs for the tasks"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs for the tasks"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Whether to assign a public IP to the task ENI"
  default     = false
}

variable "blue_target_group_arn" {
  description = "The ARN of the blue target group"
}

variable "container_name" {
  description = "The container name"
}

variable "container_port" {
  description = "The container port to expose"
  default     = 80
}

variable "tags" {
  description = "Tags to apply to the ECS service"
  type        = map(string)
  default     = {}
}
