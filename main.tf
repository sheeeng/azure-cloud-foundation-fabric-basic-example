# provider "azurerm" {
#   subscription_id = var.subscription_id
#   client_id       = var.client_id
#   client_secret   = var.client_secret
#   tenant_id       = var.tenant_id
#   features {}
# }

# The child module requires an additional configuration for provider hashicorp/azurerm, with the local name "azurerm.vhub".
# Refer to the module's documentation to understand the intended purpose of this additional provider configuration, and then add an entry for azurerm.vhub in the "providers" meta-argument in the module block to choose which provider configuration the module should use for that purpose.
provider "azurerm" {
  alias                      = "vhub"
  skip_provider_registration = true
  subscription_id            = data.azurerm_client_config.current.subscription_id
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  features {}
}

# data "azurerm_subscription" "primary" {}
data "azurerm_client_config" "current" {}

module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "~>5.6.2"

  # The child module requires an additional configuration for provider hashicorp/azurerm, with the local name "azurerm.vhub".
  # Refer to the module's documentation to understand the intended purpose of this additional provider configuration, and then add an entry for azurerm.vhub in the "providers" meta-argument in the module block to choose which provider configuration the module should use for that purpose.
  providers = {
    azurerm = azurerm.vhub
  }

  global_settings = var.global_settings
  resource_groups = var.resource_groups
  apim            = var.apim
}
