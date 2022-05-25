module "public_ip" {
  source              = "./module"
  resource_group_name = module.resource_group.name
  location            = var.region
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}
