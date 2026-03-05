# complete

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.117 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | terraform.registry.launch.nttdata.com/module_library/resource_name/launch | ~> 2.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm | ~> 1.0 |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | terraform.registry.launch.nttdata.com/module_primitive/storage_account/azurerm | ~> 1.0 |
| <a name="module_backup_vault"></a> [backup\_vault](#module\_backup\_vault) | terraform.registry.launch.nttdata.com/module_primitive/data_protection_backup_vault/azurerm | ~> 0.1.1 |
| <a name="module_backup_policy_blob_storage"></a> [backup\_policy\_blob\_storage](#module\_backup\_policy\_blob\_storage) | terraform.registry.launch.nttdata.com/module_primitive/data_protection_backup_policy_blob_storage/azurerm | ~> 1.0 |
| <a name="module_backup_instance_blob_storage"></a> [backup\_instance\_blob\_storage](#module\_backup\_instance\_blob\_storage) | ../../ | n/a |

## Resources

No resources.

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
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_backup_vault_id"></a> [backup\_vault\_id](#output\_backup\_vault\_id) | n/a |
| <a name="output_backup_policy_blob_storage_id"></a> [backup\_policy\_blob\_storage\_id](#output\_backup\_policy\_blob\_storage\_id) | n/a |
<!-- END_TF_DOCS -->
