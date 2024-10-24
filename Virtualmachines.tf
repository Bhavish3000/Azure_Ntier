resource "azurerm_linux_virtual_machine" "pub_tier" {
  count                 = length(var.webtier_vm)
  name                  = var.webtier_vm[count.index].name
  resource_group_name   = azurerm_resource_group.base.name
  location              = azurerm_resource_group.base.location
  size                  = var.webtier_vm[count.index].size
  admin_username        = var.webtier_vm[count.index].admin_username
  network_interface_ids = [azurerm_network_interface.public[count.index].id]
  admin_ssh_key {
    username   = var.webtier_vm[count.index].username
    public_key = file("~/.ssh/id_rsapub.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.webtier_vm[count.index].publisher
    offer     = var.webtier_vm[count.index].offer
    sku       = var.webtier_vm[count.index].sku
    version   = var.webtier_vm[count.index].version
  }

}

resource "azurerm_linux_virtual_machine" "pri_tier" {
  count                 = length(var.privatetier_vm)
  name                  = var.privatetier_vm[count.index].name
  resource_group_name   = azurerm_resource_group.base.name
  location              = azurerm_resource_group.base.location
  size                  = var.privatetier_vm[count.index].size
  admin_username        = var.privatetier_vm[count.index].admin_username
  network_interface_ids = [azurerm_network_interface.app[count.index].id]
  admin_ssh_key {
    username   = var.privatetier_vm[count.index].username
    public_key = file("~/.ssh/id_rsapub.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.privatetier_vm[count.index].publisher
    offer     = var.privatetier_vm[count.index].offer
    sku       = var.privatetier_vm[count.index].sku
    version   = var.privatetier_vm[count.index].version
  }

}