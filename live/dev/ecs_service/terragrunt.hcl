include {
  path = find_in_parent_folders()
}

inputs = {
  service_name               = "<ECS_SERVICE_NAME>"
  cluster_id                 = "arn:aws:ecs:<AWS_REGION>:<AWS_ACCOUNT_ID>:cluster/<ECS_CLUSTER_NAME>"
  task_definition_arn        = "arn:aws:ecs:<AWS_REGION>:<AWS_ACCOUNT_ID>:task-definition/<TASK_DEFINITION_NAME>:<TASK_REVISION>"
  desired_count              = <DESIRED_TASK_COUNT>
  subnets                    = ["<SUBNET_ID_1>", "<SUBNET_ID_2>", "<SUBNET_ID_3>"]
  security_groups            = ["<SECURITY_GROUP_ID>"]
  assign_public_ip           = <true|false>
  blue_target_group_arn      = "arn:aws:elasticloadbalancing:<AWS_REGION>:<AWS_ACCOUNT_ID>:targetgroup/<BLUE_TG_NAME>/<TG_ID_1>"
  green_target_group_arn     = "arn:aws:elasticloadbalancing:<AWS_REGION>:<AWS_ACCOUNT_ID>:targetgroup/<GREEN_TG_NAME>/<TG_ID_2>"
  container_name             = "<CONTAINER_NAME>"
  container_port             = <CONTAINER_PORT>
  tags = {
    Environment = "<ENVIRONMENT>"
    Project     = "<PROJECT_NAME>"
  }
}
