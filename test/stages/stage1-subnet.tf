module "subnets" {
  source = "github.com/cloud-native-toolkit/terraform-azure-subnets"

  resource_group_name = module.resource_group.name
  region              = var.region
  vpc_name            = module.vnet.name
  _count              = 3
  ipv4_cidr_blocks    = ["10.1.1.0/24"]
  enabled             = true
  acl_rules = [{
    name        = "AzureBastionSubnet"
    action      = "Allow"
    direction   = "Inbound"
    source      = "*"
    destination = "*"
    tcp = {
      port_min        = 22
      port_max        = 22
      source_port_min = 22
      source_port_max = 22
    }
  }]
}

resource "null_resource" "print_enabled" {
  provisioner "local-exec" {
    command = "echo -n '${module.subnets.enabled}' > .enabled"
  }
}