variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "container_groups" {
  description = "Map of container instance groups to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-containerinstance-containergroup/azurerm v0.2.0 (https://registry.terraform.io/modules/Azure/avm-res-containerinstance-containergroup/azurerm/0.2.0) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                = string
    tags                                = optional(map(string))
    enable_telemetry                    = optional(bool)
    liveness_probe                      = optional(any, null)
    subnet_ids                          = optional(list(string), null)
    zones                               = optional(list(string), null)
    dns_name_servers                    = optional(list(string), null)
    key_vault_user_assigned_identity_id = optional(string, null)
    managed_identities                  = optional(any, null)
    private_endpoints                   = optional(any, null)
    readiness_probe                     = optional(any, null)
    restart_policy                      = string
    containers                          = optional(any, null)
    diagnostics_log_analytics           = optional(any, null)
    dns_name_label                      = optional(string, null)
    image_registry_credential           = optional(any, null)
    key_vault_key_id                    = optional(string, null)
    role_assignments                    = optional(any, null)
    os_type                             = string
    dns_name_label_reuse_policy         = optional(string, null)
    priority                            = optional(string, null)
    exposed_ports                       = optional(any, null)
  }))
  default = {}
}
