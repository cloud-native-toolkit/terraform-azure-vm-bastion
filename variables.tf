variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group where the bastion host has been provisioned"
}

variable "region" {
  type        = string
  description = "The Azure location where the bastion host will be installed"
}

variable "virtual_network_name" {
  type        = string
  description = "The Azure virtual network name"
}

variable "subnet_id" {
  type        = string
  description = "The Azure subnet id"
}


# variable "subnet_address_space" {
#   type        = list(string)
#   description = "The Azure subnet address prefixes"
# }

variable "ip_configuration_name" {
  type        = string
  description = "The Azure ip configuration name which is used in vm bastion host"

}

variable "bastion_host_name" {
  type        = string
  description = "This is the name of Azure bastion host name"
}

variable "public_ip_name" {
  type        = string
  description = "A Public IP Address name which should be associated with the bastion host resource."
}

variable "public_ip_allocation_method" {
  type        = string
  description = "Public IP address allocation method - Static or Dynamic"
  default     = "Static"
}

variable "public_ip_sku" {
  type        = string
  description = "The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard."
  default     = "Standard"
}

variable "public_ip_zones" {
  type        = list(string)
  description = "Specifies a list of public ip zones in which this bastion host should be located."
  default     = ["1"]
}

variable "subnet_name" {
  type        = string
  description = "The bastion host subnet name"
  default     = "AzureBastionSubnet"
}


