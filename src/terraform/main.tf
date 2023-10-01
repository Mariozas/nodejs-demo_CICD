terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

data "azurerm_resource_group" "Marius_S_rg" {
  name = "Marius_S_rg"
}

module "cluster" {
  source = "./modules/cluster"
  location = var.location
  kubernetes_version = var.kubernetes_version
  resource_group_name = data.azurerm_resource_group.Marius_S_rg.name
}

module "k8s" {
  source = "./modules/K8s"
  host = "${module.cluster.host}"
  client_certificate = "${base64decode(module.cluster.client_certificate)}"
  client_key= "${base64decode(module.cluster.client_key)}"
  cluster_ca_certificate = "${base64decode(module.cluster.cluster_ca_certificate)}"
}
