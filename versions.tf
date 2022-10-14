terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.99" # "~> 3.27.0" # TODO: AzureRM version 3 does not work.
    }
  }
  required_version = ">= 1.3.1"
}
