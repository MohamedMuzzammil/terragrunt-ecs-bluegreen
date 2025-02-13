variable "ecr_repo_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "task_family" {
  description = "The name of the ECS task family"
  type        = string
}

variable "container_name" {
  description = "The name of the container in the ECS task definition"
  type        = string
}

variable "container_cpu" {
  description = "CPU units for the container"
  type        = number
}

variable "container_memory" {
  description = "Memory for the container in MiB"
  type        = number
}

variable "execution_role_arn" {
  description = "The ARN of the execution role for the ECS task"
  type        = string
}

variable "task_role_arn" {
  description = "The ARN of the task role for the ECS task"
  type        = string
}

variable "task_cpu" {
  description = "The CPU units for the ECS task"
  type        = number
}

variable "task_memory" {
  description = "The amount of memory (in MiB) allocated to the ECS task"
  type        = number
}
