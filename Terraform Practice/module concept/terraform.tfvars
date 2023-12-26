RG = {
  g1 = {
    name     = "Devtest-RG"
    location = "East US"
    tags = {
      Created_by = "Pradeep"
    }
  }

}

VNET = {
  vnet1 = {
    name                = "DEV-vnet"
    location            = "East US"
    resource_group_name = "Devtest-RG"
    address_space       = ["10.0.0.0/16"]
    tags = {
      created_by = "PradeepDev"
    }
  }

}
subnet = {
  subnet1 = {
    name                 = "Fronend"
    virtual_network_name = "Dev-vnet"
    resource_group_name  = "Devtest-RG"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "Dev-vnet"
    resource_group_name  = "Devtest-RG"
    address_prefixes     = ["10.0.5.0/24"]
  }

  subnet3 = {
    name                 = "Backend"
    virtual_network_name = "Dev-vnet"
    resource_group_name  = "Devtest-RG"
    address_prefixes     = ["10.0.2.0/24"]

  }

}

pip = {
  pip1 = {
    name                = "todo_pip"
    location            = "East US"
    resource_group_name = "Devtest-RG"
    allocation_method   = "Dynamic"
    sku                 = "Basic"
  }
  pip2 = {
    name                = "todo_bpip"
    location            = "East US"
    resource_group_name = "Devtest-RG"
    allocation_method   = "Dynamic"
    sku                 = "Basic"
  }
}

NSG = {
  nsg1 = {
    name                = "fronendnsg"
    location            = "East US"
    resource_group_name = "Devtest-RG"
  }
  nsg2 = {
    name                = "backendnsg"
    location            = "East US"
    resource_group_name = "Devtest-RG"
  }
}
nic = {
  nic1 = {
    name                 = "Fronend-nic"
    location             = "East US"
    resource_group_name  = "Devtest-RG"
    subnet_id            = "/subscriptions/70fece7e-9099-478e-ad53-e779d7f539a0/resourceGroups/Devtest-RG/providers/Microsoft.Network/virtualNetworks/Dev-vnet/subnets/Fronend"
    public_ip_address_id = "/subscriptions/70fece7e-9099-478e-ad53-e779d7f539a0/resourceGroups/Devtest-RG/providers/Microsoft.Network/publicIPAddresses/todo_pip"
  }


  nic2 = {
    name                 = "Backend-nic"
    location             = "East US"
    resource_group_name  = "Devtest-RG"
    subnet_id            = "/subscriptions/70fece7e-9099-478e-ad53-e779d7f539a0/resourceGroups/Devtest-RG/providers/Microsoft.Network/virtualNetworks/Dev-vnet/subnets/Backend"
    # public_ip_address_id = "/subscriptions/70fece7e-9099-478e-ad53-e779d7f539a0/resourceGroups/Devtest-RG/providers/Microsoft.Network/publicIPAddresses/todo_bpip"
  }

}

VM = {
  vm1 = {
    name                  = "Fronend-VM"
    location              = "East US"
    resource_group_name   = "Devtest-RG"
    network_interface_ids = ["/subscriptions/70fece7e-9099-478e-ad53-e779d7f539a0/resourceGroups/Devtest-RG/providers/Microsoft.Network/networkInterfaces/Fronend-nic"]
    vm_size               = "Standard_B2ms"

  }
  vm2 = {
    name                  = "Backend-VM"
    location              = "East US"
    resource_group_name   = "Devtest-RG"
    network_interface_ids = ["/subscriptions/70fece7e-9099-478e-ad53-e779d7f539a0/resourceGroups/Devtest-RG/providers/Microsoft.Network/networkInterfaces/Backend-nic"]
    vm_size               = "Standard_B2ms"

  }
}