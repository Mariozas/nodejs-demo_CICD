
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id            = "3a42b7ad-f305-4fa5-9a8a-9310a9c7f4ad"
  tenant_id                  = "025f275e-d826-4473-82b9-e40a4925777c"
  skip_provider_registration = true
}

# Creating Kubernetes Cluster
resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "Marius_KC"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "Marius-dns"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

}