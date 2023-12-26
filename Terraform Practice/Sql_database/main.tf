resource "azurerm_sql_database" "example" {
  name                = "todosqldb"
  resource_group_name = "Devtest-RG"
  location            = "eastus"
  server_name         = "todosqlserver"
}
