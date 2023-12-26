module "RG" {
  source = "../RG"
  RG     = var.RG

}

module "vnet" {
  depends_on = [module.RG]
  source     = "../VNET"
  VNET       = var.VNET
}

module "Subnet" {
  depends_on = [module.vnet]
  source     = "../subnet"
  subnet     = var.subnet

}

module "PIP" {
  depends_on = [module.RG]
  source     = "../public_ip"
  pip        = var.pip
}

module "NSG" {
  depends_on = [module.Subnet]
  source     = "../NSG"
  NSG        = var.NSG

}

module "nic" {
  depends_on = [module.NSG]
  source     = "../NIC"
  nic        = var.nic

}
module "VM" {
  depends_on = [module.nic]
  source     = "../vm"
  VM         = var.VM
}

module "sql_server" {
  depends_on = [ module.RG ]
  source = "../sql_server"
  
}

module "sql_database" {
  depends_on = [ module.sql_server ]
  source = "../Sql_database"
  
}

module "Bastion" {
  depends_on = [ module.PIP,module.Subnet ]
  source = "../AzureBastion"
  
}

