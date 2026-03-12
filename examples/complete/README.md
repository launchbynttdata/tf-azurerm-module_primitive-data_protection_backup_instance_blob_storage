# complete

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.117 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.8 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.8.1 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.13.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | terraform.registry.launch.nttdata.com/module_library/resource_name/launch | ~> 2.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm | ~> 1.0 |
| <a name="module_backup_storage_reader"></a> [backup\_storage\_reader](#module\_backup\_storage\_reader) | terraform.registry.launch.nttdata.com/module_primitive/role_assignment/azurerm | ~> 1.0 |
| <a name="module_vault_storage_backup_contributor"></a> [vault\_storage\_backup\_contributor](#module\_vault\_storage\_backup\_contributor) | terraform.registry.launch.nttdata.com/module_primitive/role_assignment/azurerm | ~> 1.0 |
| <a name="module_vault_blob_contributor"></a> [vault\_blob\_contributor](#module\_vault\_blob\_contributor) | terraform.registry.launch.nttdata.com/module_primitive/role_assignment/azurerm | ~> 1.0 |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | terraform.registry.launch.nttdata.com/module_primitive/storage_account/azurerm | ~> 1.0 |
| <a name="module_storage_container"></a> [storage\_container](#module\_storage\_container) | terraform.registry.launch.nttdata.com/module_primitive/storage_container/azurerm | ~> 1.0 |
| <a name="module_backup_vault"></a> [backup\_vault](#module\_backup\_vault) | terraform.registry.launch.nttdata.com/module_primitive/data_protection_backup_vault/azurerm | ~> 0.1.1 |
| <a name="module_backup_policy_blob_storage"></a> [backup\_policy\_blob\_storage](#module\_backup\_policy\_blob\_storage) | terraform.registry.launch.nttdata.com/module_primitive/data_protection_backup_policy_blob_storage/azurerm | ~> 1.0 |
| <a name="module_backup_instance_blob_storage"></a> [backup\_instance\_blob\_storage](#module\_backup\_instance\_blob\_storage) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [random_uuid.ra_blob_data](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [random_uuid.ra_reader](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [random_uuid.ra_sa_backup](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [time_sleep.wait_for_rbac](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-launch-module\_library-resource\_name to generate resource names | <pre>map(object({<br/>    name       = string<br/>    max_length = optional(number, 60)<br/>  }))</pre> | <pre>{<br/>  "backup_instance_blob_storage": {<br/>    "max_length": 80,<br/>    "name": "bibs"<br/>  },<br/>  "backup_policy_blob_storage": {<br/>    "max_length": 80,<br/>    "name": "bpbs"<br/>  },<br/>  "backup_vault": {<br/>    "max_length": 80,<br/>    "name": "bv"<br/>  },<br/>  "resource_group": {<br/>    "max_length": 80,<br/>    "name": "rg"<br/>  },<br/>  "storage_account": {<br/>    "max_length": 80,<br/>    "name": "sa"<br/>  }<br/>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_class_env"></a> [class\_env](#input\_class\_env) | n/a | `string` | n/a | yes |
| <a name="input_instance_env"></a> [instance\_env](#input\_instance\_env) | n/a | `string` | n/a | yes |
| <a name="input_instance_resource"></a> [instance\_resource](#input\_instance\_resource) | n/a | `string` | n/a | yes |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | n/a | `string` | n/a | yes |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_instance_blob_storage_id"></a> [backup\_instance\_blob\_storage\_id](#output\_backup\_instance\_blob\_storage\_id) | n/a |
| <a name="output_backup_instance_blob_storage_name"></a> [backup\_instance\_blob\_storage\_name](#output\_backup\_instance\_blob\_storage\_name) | Name of the Backup Instance (Blob Storage) |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | Name of the Storage Account |
| <a name="output_name"></a> [name](#output\_name) | Alias for storage\_account\_name (used by some terratests) |
| <a name="output_backup_vault_id"></a> [backup\_vault\_id](#output\_backup\_vault\_id) | n/a |
| <a name="output_backup_vault_name"></a> [backup\_vault\_name](#output\_backup\_vault\_name) | Name of the Backup Vault |
| <a name="output_backup_policy_blob_storage_id"></a> [backup\_policy\_blob\_storage\_id](#output\_backup\_policy\_blob\_storage\_id) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
<!-- END_TF_DOCS -->
