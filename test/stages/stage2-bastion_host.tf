module "public_ip" {
  source              = "./module"
  resource_group_name = module.resource_group.name
  location            = var.region
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

module "bastion_host" {
  source              = "./module"
  resource_group_name = module.resource_group.name
  location            = var.region

  ip_configuration {
    name                 = "ahm_ip_config_bastion"
    subnet_id            = module.subnets.ids[0]
    public_ip_address_id = module.public_ip.id
  }
}

