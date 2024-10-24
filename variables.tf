variable "azurerm_resource_group" {
  type = object({
    name     = string
    location = string
  })

}

variable "azurerm_virtual_network" {
  type = object({
    name          = string
    address_space = list(string)
  })

}

variable "public_azurerm_subnet" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))

}

variable "app_azurerm_subnet" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))

}
variable "db_azurerm_subnet" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))

}

variable "azurerm_network_interface_public" {
  type = list(object({
    name = string
    ip_configuration = object({
      name = string
    })
  }))

}

variable "azurerm_public_ip" {
  type = list(object({
    name              = string
    allocation_method = string
  }))

}

variable "azurerm_network_interface_app" {
  type = list(object({
    name = string
    ip_configuration = object({
      name = string
    })
  }))

}

variable "azurerm_network_interface_db" {
  type = list(object({
    name = string
    ip_configuration = object({
      name = string
    })
  }))

}

variable "webtier_vm" {
  type = list(object({
    name           = string
    size           = string
    admin_username = string
    username       = string
    sku            = string
    publisher      = string
    offer          = string
    version        = string
  }))

}

variable "privatetier_vm" {
  type = list(object({
    name           = string
    size           = string
    admin_username = string
    username       = string
    sku            = string
    publisher      = string
    offer          = string
    version        = string
  }))

}

variable "web_security" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string

    }))
  })
}

variable "private_security" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string

    }))
  })

}

variable "db_security" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string

    }))
  })

}