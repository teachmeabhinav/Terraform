provider "azurerm" {
version = "=2.17.0"
features {}
}
resource "azurerm_resource_group" "example" {
  name     = "abhinavEventhub"
  location = "East US2"
}

resource "azurerm_eventhub_namespace" "example" {
  name                = "abhinavEventhubNamespace"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  capacity            = 1

  tags = {
    environment = "Dev"
  }
}

resource "azurerm_eventhub" "example" {
  name                = "abhinavTestEventHub"
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
  partition_count     = 2
  message_retention   = 1
}
resource "azurerm_eventhub" "example1" {
  name                = "abhinavTestEventHub2"
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
  partition_count     = 2
  message_retention   = 1
}
resource "azurerm_storage_account" "example" {
  name                     = "eventhubstorageabhinav"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Dev"
  }
}