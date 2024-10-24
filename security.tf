resource "azurerm_network_security_group" "web" {
  name                = "web_NSG"
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location

}

resource "azurerm_subnet_network_security_group_association" "web_association" {
  subnet_id                 = azurerm_subnet.public[0].id
  network_security_group_id = azurerm_network_security_group.web.id
}

resource "azurerm_network_security_rule" "web" {
  count                       = length(var.web_security.rules)
  name                        = var.web_security.rules[count.index].name
  resource_group_name         = azurerm_resource_group.base.name
  network_security_group_name = azurerm_network_security_group.web.name
  priority                    = var.web_security.rules[count.index].priority
  direction                   = var.web_security.rules[count.index].direction
  access                      = var.web_security.rules[count.index].access
  protocol                    = var.web_security.rules[count.index].protocol
  source_port_range           = var.web_security.rules[count.index].source_port_range
  destination_port_range      = var.web_security.rules[count.index].destination_port_range
  source_address_prefix       = var.web_security.rules[count.index].source_address_prefix
  destination_address_prefix  = var.web_security.rules[count.index].destination_address_prefix
  depends_on                  = [azurerm_network_security_group.web]

}

resource "azurerm_network_security_group" "app" {
  name                = "app_NSG"
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location

}

resource "azurerm_subnet_network_security_group_association" "app_association" {
  subnet_id                 = azurerm_subnet.app[0].id
  network_security_group_id = azurerm_network_security_group.app.id
}

resource "azurerm_network_security_rule" "app" {
  count                       = length(var.private_security.rules)
  name                        = var.private_security.rules[count.index].name
  resource_group_name         = azurerm_resource_group.base.name
  network_security_group_name = azurerm_network_security_group.app.name
  priority                    = var.private_security.rules[count.index].priority
  direction                   = var.private_security.rules[count.index].direction
  access                      = var.private_security.rules[count.index].access
  protocol                    = var.private_security.rules[count.index].protocol
  source_port_range           = var.private_security.rules[count.index].source_port_range
  destination_port_range      = var.private_security.rules[count.index].destination_port_range
  source_address_prefix       = var.private_security.rules[count.index].source_address_prefix
  destination_address_prefix  = var.private_security.rules[count.index].destination_address_prefix
  depends_on                  = [azurerm_network_security_group.app]
}

resource "azurerm_network_security_group" "db" {
  name                = "db_NSG"
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location

}

resource "azurerm_subnet_network_security_group_association" "db_association" {
  subnet_id                 = azurerm_subnet.db[0].id
  network_security_group_id = azurerm_network_security_group.db.id
}


resource "azurerm_network_security_rule" "db" {
  count                       = length(var.db_security.rules)
  name                        = var.db_security.rules[count.index].name
  resource_group_name         = azurerm_resource_group.base.name
  network_security_group_name = azurerm_network_security_group.db.name
  priority                    = var.db_security.rules[count.index].priority
  direction                   = var.db_security.rules[count.index].direction
  access                      = var.db_security.rules[count.index].access
  protocol                    = var.db_security.rules[count.index].protocol
  source_port_range           = var.db_security.rules[count.index].source_port_range
  destination_port_range      = var.db_security.rules[count.index].destination_port_range
  source_address_prefix       = var.db_security.rules[count.index].source_address_prefix
  destination_address_prefix  = var.db_security.rules[count.index].destination_address_prefix
  depends_on                  = [azurerm_network_security_group.db]
}
