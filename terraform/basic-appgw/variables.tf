variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {
    project = "azure-appgw-demo"
  }
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "agw-vnet"
}

variable "address_space" {
  description = "VNet address space"
  type        = string
  default     = "10.0.0.0/16"
}

variable "appgw_subnet_name" {
  description = "Subnet name for Application Gateway"
  type        = string
  default     = "appgw-subnet"
}

variable "appgw_subnet_prefix" {
  description = "Subnet CIDR for Application Gateway"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_ip_name" {
  description = "Public IP name for the gateway"
  type        = string
  default     = "agw-pip"
}

variable "appgw_name" {
  description = "Application Gateway name"
  type        = string
  default     = "agw-demo"
}

variable "sku_name" {
  description = "SKU name (Standard_v2 or WAF_v2)"
  type        = string
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "SKU tier (Standard_v2 or WAF_v2)"
  type        = string
  default     = "Standard_v2"
}

variable "sku_capacity" {
  description = "Instance count (capacity) for fixed mode"
  type        = number
  default     = 2
}

variable "backend_ip_addresses" {
  description = "List of backend IP addresses"
  type        = list(string)
  default     = []
}
