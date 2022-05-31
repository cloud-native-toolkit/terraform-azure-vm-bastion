
module "azure_vm_bastion" {
  source                      = "./module"
  resource_group_name         = module.resource_group.name
  region                      = var.region
  bastion_host_name           = "ahm_vm_bastion"
  ip_configuration_name       = "ahm_ip_config_bastion"
  virtual_network_name        = module.vnet.id
  public_ip_name              = "ahm_public_ip"
  public_ip_allocation_method = "Static"
  public_ip_sku               = "Standard"
  public_ip_zones             = ["1"]
  subnet_address_space        = ["10.0.0.0/24"]
}