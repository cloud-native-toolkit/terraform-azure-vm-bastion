module "subnets" {
  source = "github.com/cloud-native-toolkit/terraform-azure-subnets"

  resource_group_name = module.resource_group.name
  region              = var.region
  vpc_name = module.vnet.name
  _count = 3
  ipv4_cidr_blocks = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  acl_rules = [{
    name = "ssh-inbound"
    action = "Allow"
    direction = "Inbound"
    source = "*"
    destination = "*"
    tcp = {
      destination_port_range = "22"
      source_port_range = "*"
    }
  }, {
    name = "vpn-inbound"
    action = "Allow"
    direction = "Inbound"
    source = "*"
    destination = "*"
    udp = {
      destination_port_range = "1194"
      source_port_range = "*"
    }
  }]
}

