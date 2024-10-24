resource "azurerm_virtual_network" "base" {
  name                = var.azurerm_virtual_network.name
  resource_group_name = azurerm_resource_group.base.name
  address_space       = var.azurerm_virtual_network.address_space
  location            = azurerm_resource_group.base.location
  depends_on          = [azurerm_resource_group.base]

}

resource "azurerm_subnet" "public" {
  count                = length(var.public_azurerm_subnet)
  name                 = var.public_azurerm_subnet[count.index].name
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = var.public_azurerm_subnet[count.index].address_prefixes
  depends_on           = [azurerm_virtual_network.base]
}

resource "azurerm_subnet" "app" {
  count                = length(var.app_azurerm_subnet)
  name                 = var.app_azurerm_subnet[count.index].name
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = var.app_azurerm_subnet[count.index].address_prefixes
  depends_on           = [azurerm_virtual_network.base]
}
resource "azurerm_subnet" "db" {
  count                = length(var.db_azurerm_subnet)
  name                 = var.db_azurerm_subnet[count.index].name
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = var.db_azurerm_subnet[count.index].address_prefixes
  depends_on           = [azurerm_virtual_network.base]
}



resource "azurerm_network_interface" "public" {
  count               = length(var.azurerm_network_interface_public)
  name                = var.azurerm_network_interface_public[count.index].name
  location            = azurerm_resource_group.base.location
  resource_group_name = azurerm_resource_group.base.name
  ip_configuration {
    name                          = var.azurerm_network_interface_public[count.index].ip_configuration.name
    subnet_id                     = azurerm_subnet.public[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }

}

resource "azurerm_network_interface" "app" {
  count               = length(var.azurerm_network_interface_app)
  name                = var.azurerm_network_interface_app[count.index].name
  location            = azurerm_resource_group.base.location
  resource_group_name = azurerm_resource_group.base.name
  ip_configuration {
    name                          = var.azurerm_network_interface_app[count.index].ip_configuration.name
    subnet_id                     = azurerm_subnet.app[0].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_network_interface" "db" {
  count               = length(var.azurerm_network_interface_db)
  name                = var.azurerm_network_interface_db[count.index].name
  location            = azurerm_resource_group.base.location
  resource_group_name = azurerm_resource_group.base.name
  ip_configuration {
    name                          = var.azurerm_network_interface_db[count.index].ip_configuration.name
    subnet_id                     = azurerm_subnet.db[count.index].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "public_ip" {
  count               = length(var.azurerm_public_ip)
  name                = var.azurerm_public_ip[count.index].name
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  allocation_method   = var.azurerm_public_ip[count.index].allocation_method

}

