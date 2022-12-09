data "terraform_remote_state" "core" {
  backend = "remote"

  config = {
    organization = "iotright"
    workspaces = {
      name = "${lookup(var.workspace_for_environment, var.environment)}"
    }
  }
}

data "terraform_remote_state" "hub" {
  backend = "remote"

  config = {
    organization = "iotright"
    workspaces = {
      name = "Core-Production-VPC-Hub"
    }
  }
}
