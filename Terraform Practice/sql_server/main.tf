resource "azurerm_mssql_server" "example" {
  name                         = "todosqlserver"
  resource_group_name          = "Devtest-RG"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "admin01"
  administrator_login_password = "Admin@123456"
}