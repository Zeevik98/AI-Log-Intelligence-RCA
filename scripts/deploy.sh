#!/usr/bin/env bash
set -e

# Example script for end-to-end deployment
echo "Initializing Terraform..."
cd ../infrastructure
terraform init
terraform apply -auto-approve

echo "Setting up Kube context..."
export KUBECONFIG="$(terraform output -raw kubeconfig)"

echo "Deploying Helm charts..."
helm install log-rca ../charts/log-rca-pipeline
helm install security ../charts/security
helm install monitoring ../charts/monitoring
