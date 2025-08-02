variable "resource_group_name" {
  description = "Name of the Azure resource group"
  default     = "abb_aks-monitoring-rg"
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  default     = "abb_aks-cluster"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  default     = 1
}

variable "vm_size" {
  description = "VM size for the nodes"
  default     = "Standard_DS2_v2"
}