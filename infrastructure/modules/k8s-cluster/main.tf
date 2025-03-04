# Example skeleton for a generic cluster
resource "some_generic_k8s_cluster" "this" {
  name   = var.cluster_name
  region = var.region
  # ...
}

output "kubeconfig" {
  value = some_generic_k8s_cluster.this.kubeconfig
}
