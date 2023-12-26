resource "azurerm_network_interface" "main" {
  for_each            = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = each.value.public_ip_address_id
  }
}
# resource "azurerm_network_interface_security_group_association" "example" {
#   network_interface_id      = "/subscriptions/8c11d574-047c-4af6-9ffc-c342706850a0/resourceGroups/Dev-RG/providers/Microsoft.Network/networkInterfaces/Fronend-nic"
#   network_security_group_id = "/subscriptions/8c11d574-047c-4af6-9ffc-c342706850a0/resourceGroups/Dev-RG/providers/Microsoft.Network/networkSecurityGroups/fronendnsg"
# }