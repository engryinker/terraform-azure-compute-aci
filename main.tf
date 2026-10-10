data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "container_group" {
  source   = "Azure/avm-res-containerinstance-containergroup/azurerm"
  version  = "0.2.0"
  for_each = var.container_groups

  name                                = each.value.name
  location                            = var.location
  resource_group_name                 = var.resource_group_name
  tags                                = coalesce(each.value.tags, var.tags)
  enable_telemetry                    = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  liveness_probe                      = each.value.liveness_probe
  subnet_ids                          = each.value.subnet_ids
  zones                               = each.value.zones
  dns_name_servers                    = each.value.dns_name_servers
  key_vault_user_assigned_identity_id = each.value.key_vault_user_assigned_identity_id
  managed_identities                  = each.value.managed_identities
  private_endpoints                   = each.value.private_endpoints
  readiness_probe                     = each.value.readiness_probe
  restart_policy                      = each.value.restart_policy
  containers                          = each.value.containers
  diagnostics_log_analytics           = each.value.diagnostics_log_analytics
  dns_name_label                      = each.value.dns_name_label
  image_registry_credential           = each.value.image_registry_credential
  key_vault_key_id                    = each.value.key_vault_key_id
  role_assignments                    = each.value.role_assignments
  os_type                             = each.value.os_type
  dns_name_label_reuse_policy         = each.value.dns_name_label_reuse_policy
  priority                            = each.value.priority
  exposed_ports                       = each.value.exposed_ports
}
