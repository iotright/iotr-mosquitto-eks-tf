variable "workspace_for_environment" {
  type = map(any)
  default = {
    development = "iotr-eks-tf-development"
    qa          = "iotr-eks-tf-qa"
    staging     = "iotr-eks-tf-staging"
    production  = "iotr-eks-tf-production"
  }
}

variable "addons_workspace_for_environment" {
  type = map(any)
  default = {
    development = "iotr-eksaddons-tf-development"
    qa          = "iotr-eksaddons-tf-qa"
    staging     = "iotr-eksaddons-tf-staging"
    production  = "iotr-eksaddons-tf-production"
  }
}

locals {
  serviceName = "${var.environment}-mosquitto"
  svcAcctName = "${var.environment}-mosquitto-sa"
}
