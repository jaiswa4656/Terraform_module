resource "azurerm_network_security_group" "example" {
  for_each            = var.NSG
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  #  security_rule {
  #     name                       = "test1234"
  #     priority                   = 101
  #     direction                  = "Inbound"
  #     access                     = "Allow"
  #     protocol                   = "Tcp"
  #     source_port_range          = "*"
  #     destination_port_range     = "22"
  #     source_address_prefix      = "*"
  #     destination_address_prefix = "*"
  #}
  tags = {
    environment = "Production"
  }
}

