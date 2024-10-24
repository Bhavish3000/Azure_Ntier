azurerm_resource_group = {
  name     = "n_tier"
  location = "East US"
}

azurerm_virtual_network = {
  name          = "N_tier_vnet"
  address_space = ["10.0.0.0/16"]
}
public_azurerm_subnet = [
  {
    name             = "web_tier"
    address_prefixes = ["10.0.0.0/24"]
  }
]

app_azurerm_subnet = [
  {
    name             = "app_tier"
    address_prefixes = ["10.0.1.0/24"]
  },
]
db_azurerm_subnet = [{

  name             = "db_tier"
  address_prefixes = ["10.0.2.0/24"]

}]
azurerm_network_interface_public = [{
  name = "pub_NI1"
  ip_configuration = {
    name = "web_ipconfig1"
  }
  },
  {
    name = "pub_NI2"
    ip_configuration = {
      name = "web_ipconfig1"
    }
}]

azurerm_public_ip = [{
  name              = "web_pubip1"
  allocation_method = "Static"
  },
  {
    name              = "web_pubip2"
    allocation_method = "Static"
}]

azurerm_network_interface_app = [{
  name = "app1_NI"
  ip_configuration = {
    name = "app1_ipconfig"
  }

  },
  {
    name = "app2_NI"
    ip_configuration = {
      name = "app2_ipconfig"
    }
  },

]
azurerm_network_interface_db = [{
  name = "db_NI"
  ip_configuration = {
    name = "db_ipconfig"
  }
}]

webtier_vm = [{
  name           = "web1"
  size           = "Standard_B1s"
  offer          = "ubuntu-24_04-lts"
  publisher      = "Canonical"
  sku            = "server"
  version        = "latest"
  admin_username = "devops"
  username       = "devops"
  },
  {
    name           = "web2"
    size           = "Standard_B1s"
    offer          = "ubuntu-24_04-lts"
    publisher      = "Canonical"
    sku            = "server"
    version        = "latest"
    admin_username = "devops"
    username       = "devops"
}]

privatetier_vm = [{
  name           = "app1"
  size           = "Standard_B1s"
  offer          = "ubuntu-24_04-lts"
  publisher      = "Canonical"
  sku            = "server"
  version        = "latest"
  admin_username = "devops"
  username       = "devops"
  },
  {
    name           = "app2"
    size           = "Standard_B1s"
    offer          = "ubuntu-24_04-lts"
    publisher      = "Canonical"
    sku            = "server"
    version        = "latest"
    admin_username = "devops"
    username       = "devops"
  }
]

web_security = {
  name = "web_nsg"
  rules = [{
    name                       = "openssh"
    priority                   = 300
    direction                  = "Inbound"
    protocol                   = "Tcp"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }]
}

private_security = {
  name  = "app_nsg"
  rules = []
}

db_security = {
  name  = "db_nsg"
  rules = []
}