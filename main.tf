resource "azurerm_resource_group" "rg1" {
  name     = var.shashi
  location = var.varanasi
}

resource "azurerm_storage_account" "stg1" {
  name                     = var.stgdelhi
  resource_group_name      = var.shashi
  location                 = var.lucknow
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "cont1" {
  name                  = var.testcont1
  storage_account_id    = azurerm_storage_account.stg1.id
  container_access_type = "private"
}


resource "azurerm_virtual_network" "vnet1" {
  name                = var.myvnet
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.mysubnet
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet_address
}