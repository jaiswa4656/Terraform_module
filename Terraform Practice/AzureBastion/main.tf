resource "azurerm_bastion_host" "example" {
  name                = "todobastion"
  location            = "eastus"
  resource_group_name = "Devtest-RG"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = "/subscriptions/70fece7e-9099-478e-ad53-e779d7f539a0/resourceGroups/Devtest-RG/providers/Microsoft.Network/virtualNetworks/Dev-vnet/subnets/AzureBastionSubnet"
    public_ip_address_id = "/subscriptions/70fece7e-9099-478e-ad53-e779d7f539a0/resourceGroups/Devtest-RG/providers/Microsoft.Network/publicIPAddresses/todo_bpip"
  }
}