provider "azurerm" {
  features {}
}

module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "~> 5.6.2"

  providers = {
    azurerm.vhub = azurerm
  }

  global_settings = var.global_settings
  resource_groups = var.resource_groups
}
