# Azure workload
variable "resource_group_name" {
  type = string
  description = "(Required) Resource group name"
}

variable "vnet_resource_group_name" {
  type = string
  description = "(Required) Azure virtual network resource group"
}

variable "location" {
  type = string
  description = "(Optional) Resource group location"
  default = "westeurope"
}

variable "description" {
  type = string
  description = "(Required) Resource group description"
}

# Azure Key vault
variable "akv_name" {
  type = string
  description = "(Required) Key Vault name"
}

# Azure storage account
variable "sta_name" {
  type = string
  description = "(Required) Storage account name"
}

# MongoDB Atlas project
variable "organization_id" {
  type = string
  description = "(Required) MongoDB Atlas Organization ID"
}

variable "project_name" {
  type = string
  description = "(Required) MongoDB Atlas project name"
}

# MongoDB Atlas cluster
variable "cluster_name" {
  type = string
  description = "(Required) MongoDB Atlas cluster name"
}

variable "mongodb_version" {
  type = string
  description = "(Optional) MongoDB version. Default: 4.6"
  default = "4.2"
}

variable "cluster_type" {
  type = string
  description = "(Optional) MongoDB Atlas cluster type. Default: REPLICASET"
  default = "REPLICASET"
}

variable "provider_instance_size_name" {
  type = string
  description = "(Required) Provider instance size name. Default: M10"
  default = "M10"
}

# MongoDB Atlas database user
variable "database_username" {
  type = string
  description = "(Required) MongoDB database username"
}

variable "database_name" {
  type = string
  description = "(Required) Database name"
}

variable "ip_access" {
  type = string
  description = "(Required) IP Address for accessing the cluster"
  default = "0.0.0.0"
}

variable "comment" {
  type = string
  description = "(Optional) IP access comments"
  default = "Deployed by Terraform"
}

# Private link configuration
variable "vnet_name" {
  type = string
  description = "(Required) Azure virtual network name"
}

variable "subnet_name" {
  type = string
  description = "(Required) Azure subnet name"
}

variable "azure_pve_name" {
  type = string
  description = "(Required) Azure private endpoint name"
}
