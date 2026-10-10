# terraform-azure-compute-aci

Org-standard Terraform wrapper for: **container instance groups**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/<org>/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/<org>/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "compute-aci" {
  source = "git::https://github.com/<org>/terraform-azure-compute-aci.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  container_groups = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `container_groups` (container instance groups)

Wraps [Azure/avm-res-containerinstance-containergroup/azurerm](https://registry.terraform.io/modules/Azure/avm-res-containerinstance-containergroup/azurerm/0.2.0) v0.2.0.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `liveness_probe` | `any` | no |  |
| `subnet_ids` | `list(string)` | no |  |
| `zones` | `list(string)` | no |  |
| `dns_name_servers` | `list(string)` | no |  |
| `key_vault_user_assigned_identity_id` | `string` | no |  |
| `managed_identities` | `any` | no |  |
| `private_endpoints` | `any` | no |  |
| `readiness_probe` | `any` | no |  |
| `restart_policy` | `string` | yes |  |
| `containers` | `any` | no |  |
| `diagnostics_log_analytics` | `any` | no |  |
| `dns_name_label` | `string` | no |  |
| `image_registry_credential` | `any` | no |  |
| `key_vault_key_id` | `string` | no |  |
| `role_assignments` | `any` | no |  |
| `os_type` | `string` | yes |  |
| `dns_name_label_reuse_policy` | `string` | no |  |
| `priority` | `string` | no |  |
| `exposed_ports` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `container_groups` -- map (same keys as the input) of every output from each created container instance groups.
