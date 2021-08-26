terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.0.0"
    }
  }
}

# Configure the MongoDB Atlas provider
provider "azurerm" {
  features {}
}

provider "mongodbatlas" {
}

module "az_workload" {
  source  = "app.terraform.io/georgevazj-lab/workload/azure"
  version = "0.0.15"

  akv_name = var.akv_name
  description = var.description
  resource_group_name = var.resource_group_name
  sta_name = var.sta_name
}

module "project" {
  source  = "app.terraform.io/georgevazj-lab/project/mongodbatlas"
  version = "0.0.3"
  organization_id = var.organization_id
  project_name = var.project_name
}

module "cluster" {
  source  = "app.terraform.io/georgevazj-lab/cluster/mongodbatlas"
  version = "0.0.2"
  cluster_name = var.cluster_name
  project_id = module.project.project_id
  mongodb_version = var.mongodb_version
  cluster_type = var.cluster_type
  provider_instance_size_name = var.provider_instance_size_name
}

module "dbuser" {
  source  = "app.terraform.io/georgevazj-lab/dbuser/mongodbatlas"
  version = "0.0.1"

  database_name = var.database_name
  database_username = var.database_username
  database_password = var.database_password
  project_id = module.project.project_id
}

module "ipaccess" {
  source  = "app.terraform.io/georgevazj-lab/ipaccess/mongodbatlas"
  version = "0.0.1"
  project_id = module.project.project_id
  ip_address = var.ip_access
}

module "privatelink" {
  source  = "app.terraform.io/georgevazj-lab/privatelink/mongodbatlas"
  version = "0.0.2"
  azure_pve_name = var.azure_pve_name
  project_id = module.project.project_id
  resource_group_name = module.az_workload.resource_group_name
  subnet_name = var.subnet_name
  vnet_name = var.vnet_name
}