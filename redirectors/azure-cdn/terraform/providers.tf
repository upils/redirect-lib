locals {
  AZURE_SUBSCRIPTION_ID = lookup(var.credentials, "AZURE_SUBSCRIPTION_ID", "INVALID")
}

provider "azurerm" {
  version = "~> 2.4.0"
  features {}
  subscription_id = local.AZURE_SUBSCRIPTION_ID
}
