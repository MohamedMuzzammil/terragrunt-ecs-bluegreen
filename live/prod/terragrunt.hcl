terraform {
  source = "../../../modules/${path_relative_to_include()}"
}

inputs = {
  environment = "prod"
}
