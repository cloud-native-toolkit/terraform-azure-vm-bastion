
#For bastion vm host subnet must be "AzureBastionSubnet"
resource "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_space
}


resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
  zones               = var.public_ip_zones
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = var.bastion_host_name
  location            = var.region
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = azurerm_subnet.subnet.id
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}