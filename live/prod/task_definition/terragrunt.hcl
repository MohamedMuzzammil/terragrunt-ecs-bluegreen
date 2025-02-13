include {
  path = find_in_parent_folders()
}

inputs = {
  ecr_repo_name       = "<ECR_REPOSITORY_NAME>"  # Replace with your ECR repo name
  task_family         = "<TASK_FAMILY_NAME>"
  container_name      = "<CONTAINER_NAME>"
  container_memory    = 512                     # Container memory (in MB)
  container_cpu       = 256                     # Container CPU
  execution_role_arn  = "arn:aws:iam::<AWS_ACCOUNT_ID>:role/<EXECUTION_ROLE_NAME>"
  task_role_arn       = "arn:aws:iam::<AWS_ACCOUNT_ID>:role/<TASK_ROLE_NAME>"
  task_cpu            = "512"
  task_memory         = "1024"
}
