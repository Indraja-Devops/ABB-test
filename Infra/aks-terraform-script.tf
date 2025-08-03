provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "abb_aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "abb_log_analytics" {
  name                = "${var.aks_name}-law"
  location            = var.location
  resource_group_name = azurerm_resource_group.abb_aks_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_kubernetes_cluster" "abb_aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.abb_aks_rg.name
  dns_prefix          = "${var.aks_name}-dns"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.abb_log_analytics.id
    }
  }

  tags = {
    Environment = "Dev"
  }
}