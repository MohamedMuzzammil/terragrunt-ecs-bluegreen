include {
  path = find_in_parent_folders()
}

inputs = {
  codedeploy_application_name       = "<CODEDEPLOY_APP_NAME>"
  compute_platform                  = "ECS"
  codedeploy_deployment_group_name  = "<CODEDEPLOY_DEPLOYMENT_GROUP>"
  codedeploy_service_role_arn       = "arn:aws:iam::<AWS_ACCOUNT_ID>:role/<CODEDEPLOY_SERVICE_ROLE>"
  deployment_config_name            = "CodeDeployDefault.ECSAllAtOnce"
  terminate_blue_on_success         = true
  termination_wait_time_minutes     = 5
  continue_on_timeout               = true
  deployment_group_name             = "<CODEDEPLOY_DEPLOYMENT_GROUP>"
  cluster_name                      = "<ECS_CLUSTER_NAME>"
  service_name                      = "<ECS_SERVICE_NAME>"
  prod_listener_arns                = ["arn:aws:elasticloadbalancing:<AWS_REGION>:<AWS_ACCOUNT_ID>:listener/app/<LOAD_BALANCER_NAME>/<ID>"]
  blue_target_group_name            = "<BLUE_TARGET_GROUP_NAME>"
  green_target_group_name           = "<GREEN_TARGET_GROUP_NAME>"
  
  tags = {
    Environment = "<ENVIRONMENT>"
    Project     = "<PROJECT_NAME>"
  }
}
