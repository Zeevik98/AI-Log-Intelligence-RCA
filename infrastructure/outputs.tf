output "kubeconfig" {
  description = "Kubeconfig for the newly created cluster"
  value       = module.k8s_cluster.kubeconfig
  sensitive   = true
}
