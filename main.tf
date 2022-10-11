module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.4.8"

  global_settings = var.global_settings
  resource_groups = var.resource_groups
}
