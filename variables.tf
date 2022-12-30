variable "workspace_for_environment" {
  type = map(any)
  default = {
    development = "iotr-eks-tf-development"
    qa          = "iotr-eks-tf-qa"
    staging     = "iotr-eks-tf-staging"
    production  = "iotr-eks-tf-production"
  }
}

locals {
  serviceName = "${var.environment}-mosquitto"
  svcAcctName = "${var.environment}-mosquitto-sa"
}