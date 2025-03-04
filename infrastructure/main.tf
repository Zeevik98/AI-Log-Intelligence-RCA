terraform {
  required_version = ">= 1.3.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.19"
    }
    # Optionally: aws, google, azurerm if needed
  }
}

provider "kubernetes" {
  # This provider can connect to any cluster (AWS, GCP, Azure, on-prem).
  # The kubeconfig path can be specified via variables or environment.
}

module "k8s_cluster" {
  source = "./modules/k8s-cluster"
  # pass any variables needed for cluster creation
  # e.g., provider = var.provider
}

# Additional resources or references here...
