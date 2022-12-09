# Terraform Provider Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.5.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.11"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 2.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.core.outputs.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.core.outputs.cluster_id
}

# HELM Provider
provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.core.outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.core.outputs.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}


# Kubernetes provider
# https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider
# To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/terraform/kubernetes/deploy-nginx-kubernetes

# The Kubernetes provider is included in this file so the EKS module can complete successfully. Otherwise, it throws an error when creating `kubernetes_config_map.aws_auth`.
# You should **not** schedule deployments and services in this workspace. This keeps workspaces modular (one for provision EKS, another for scheduling Kubernetes resources) as per best practices.

provider "kubernetes" {
  host = data.terraform_remote_state.core.outputs.cluster_endpoint
  # token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.terraform_remote_state.core.outputs.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.core.outputs.cluster_name]
    command     = "aws"
  }
}

# Terraform kubectl Provider
provider "kubectl" {
  # Configuration options
  host                   = data.terraform_remote_state.core.outputs.cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.core.outputs.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.core.outputs.cluster_name]
    command     = "aws"
  }
}


