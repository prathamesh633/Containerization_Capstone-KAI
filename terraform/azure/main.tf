provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "capstone-rg"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "capstone-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "capstone-aks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Dev"
  }
}
