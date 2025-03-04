#!/usr/bin/env bash
set -e

echo "Destroying Helm releases..."
helm uninstall log-rca
helm uninstall security
helm uninstall monitoring

echo "Destroying Terraform infrastructure..."
cd ../infrastructure
terraform destroy -auto-approve
