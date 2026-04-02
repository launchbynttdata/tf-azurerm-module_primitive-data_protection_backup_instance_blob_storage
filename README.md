# tf-azurerm-module_primitive-data_protection_backup_instance_blob_storage
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_data_protection_backup_instance_blob_storage.backup_instance_blob_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_protection_backup_instance_blob_storage) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the Backup Instance | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the storage account | `string` | n/a | yes |
| <a name="input_vault_id"></a> [vault\_id](#input\_vault\_id) | Backup vault ID | `string` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Storage account ID | `string` | n/a | yes |
| <a name="input_backup_policy_id"></a> [backup\_policy\_id](#input\_backup\_policy\_id) | Backup policy ID | `string` | n/a | yes |
| <a name="input_storage_account_container_names"></a> [storage\_account\_container\_names](#input\_storage\_account\_container\_names) | List of blob containers to protect | `list(string)` | `null` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Configurable timeouts for backing up and restoring the Backup Instance | <pre>object({<br/>    create = optional(string, "30m")<br/>    read   = optional(string, "5m")<br/>    update = optional(string, "30m")<br/>    delete = optional(string, "30m")<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_instance_id"></a> [backup\_instance\_id](#output\_backup\_instance\_id) | The ID of the created Data Protection Backup Instance |
| <a name="output_backup_instance_name"></a> [backup\_instance\_name](#output\_backup\_instance\_name) | The name of the created Data Protection Backup Instance |
<!-- END_TF_DOCS -->
