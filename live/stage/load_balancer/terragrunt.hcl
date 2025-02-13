include {
  path = find_in_parent_folders()
}

inputs = {
  lb_name        = "<LOAD_BALANCER_NAME>"
  security_groups = ["<SECURITY_GROUP_ID>"]
  subnets        = ["<SUBNET_ID_1>", "<SUBNET_ID_2>", "<SUBNET_ID_3>"]
  vpc_id         = "<VPC_ID>"
}
