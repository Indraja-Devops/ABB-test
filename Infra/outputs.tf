output "kube_config" {
  description = "Kubeconfig command"
  value       = "Run 'az aks get-credentials --resource-group ${azurerm_resource_group.abb_aks_rg.name} --name ${azurerm_kubernetes_cluster.abb_aks.name}' to configure kubectl."
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}