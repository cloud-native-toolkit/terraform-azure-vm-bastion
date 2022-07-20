module "subnets" {
  source = "github.com/cloud-native-toolkit/terraform-azure-subnets"

  resource_group_name = module.resource_group.name
  region              = var.region
  vpc_name = module.vnet.name
  subnet_name = "AzureBastionSubnet"
  _count = 1
  ipv4_cidr_blocks = ["10.1.1.0/24"]
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
    }},
    {
    name = "AllowBastionHostCommunication"
    action = "Allow"
    direction = "Inbound"
    source = "VirtualNetwork"
    destination = "VirtualNetwork"
    any = {
      destination_port_range = "*"
      source_port_range = "8080,5701"
    }
   },
   {
    name = "AllowBastionCommunication"
    action = "Allow"
    direction = "Outbound"
    source = "VirtualNetwork"
    destination = "VirtualNetwork"
    any = {
      destination_port_range = "*"
      source_port_range = "8080,5701"
    }
}]
}

