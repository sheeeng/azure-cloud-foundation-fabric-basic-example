variable "system_name" {
  description = "(Optional) The name of the system."
  type        = string
  default     = "alpha"
}

variable "environment" {
  default     = "dev"
  description = "(Optional) The name of the environment."
  type        = string
  validation {
    condition = contains([
      "dev",
      "tst",
      "prd",
    ], var.environment)
    error_message = "Valid options are dev, tst, and prd."
  }
}

variable "subscription_id" {
  default  = "00000000-0000-0000-0000-000000000000"
  nullable = false
  type     = string
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{12}$", var.subscription_id))
    error_message = "The subscription_id value must be a valid globally unique identifier (GUID)."
  }
}

variable "client_id" {
  default  = "00000000-0000-0000-0000-000000000000"
  nullable = false
  type     = string
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{12}$", var.client_id))
    error_message = "The client_id value must be a valid globally unique identifier (GUID)."
  }
}

variable "client_secret" {
  default  = ""
  nullable = false
  type     = string
}

variable "tenant_id" {
  default  = "00000000-0000-0000-0000-000000000000"
  nullable = false
  type     = string
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{12}$", var.tenant_id))
    error_message = "The tenant_id value must be a valid globally unique identifier (GUID)."
  }
}

variable "location" {
  description = "The location in which all cloud resource will be created."
  default     = "Norway East"
  type        = string
}


# https://github.com/aztfmod/terraform-azurerm-caf/blob/main/examples/standalone.md
variable "global_settings" {
  default = {}
  type    = any
}

variable "resource_groups" {
  default = {}
  type    = any
}

variable "apim" {
  default = {}
  type    = any
}

variable "api_management_api" {
  default = {}
  type    = any
}
