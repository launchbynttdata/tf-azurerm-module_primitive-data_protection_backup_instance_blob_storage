# tf-azurerm-module_primitive-data_protection_backup_instance_blob_storage

## Overview

This Terraform module creates an Azure Data Protection backup instance for Blob Storage and associates it with a backup vault and policy.

## Usage

See [examples/complete](examples/complete) for a deployable example.

## Module Development

### Pre-Requisites

The following commands should be available on your system:

- `asdf` or `mise`
- `make`
- `python3` (for pre-commit)

Additionally, your `git` user and email must be configured. Run `make configure` from the repository root to confirm that these requirements are met.

### Pre-Commit hooks

The [.pre-commit-config.yaml](.pre-commit-config.yaml) file defines hooks for Terraform formatting, validation, documentation generation, and secret detection. Hooks are installed by `make configure`. Go linting runs through `make lint` locally and in CI.

### Terratest examples

Tests in `tests/post_deploy_functional/` and `tests/post_deploy_functional_readonly/` explicitly target `examples/complete`. The functional suite applies and destroys the example; the readonly suite uses the non-destructive runner against existing infrastructure.

### Local Validation

Before pushing changes:

1. Run `make configure` successfully.
2. Sign in to Azure and select the appropriate subscription.
3. Run the linters:

```shell
make lint
```

4. When Azure credentials are available, run the integration tests (apply, test, and destroy):

```shell
make test
```

Pre-commit validation, linting, and tests also run in CI.

### Review & Merge Process

Open a pull request to `main`. The PR title must follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) format to merge and drive semantic versioning. Ensure CI passes, address review feedback, and obtain the approvals required by `CODEOWNERS`.

### Automatic Updates

Shared configuration and workflows are managed through [launch-terraform-skeleton](https://github.com/launchbynttdata/launch-terraform-skeleton). Avoid one-off edits to generated skeleton files unless necessary. Use `copier check-update` and `copier update` when refreshing from the skeleton.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_data_protection_backup_instance_blob_storage.backup_instance_blob_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_protection_backup_instance_blob_storage) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_policy_id"></a> [backup\_policy\_id](#input\_backup\_policy\_id) | Backup policy ID | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the backup instance (must match backup vault location) | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Backup Instance | `string` | n/a | yes |
| <a name="input_storage_account_container_names"></a> [storage\_account\_container\_names](#input\_storage\_account\_container\_names) | List of blob containers to protect | `list(string)` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Storage account ID | `string` | n/a | yes |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Configurable timeouts for backing up and restoring the Backup Instance | <pre>object({<br/>    create = optional(string, "30m")<br/>    read   = optional(string, "5m")<br/>    update = optional(string, "30m")<br/>    delete = optional(string, "30m")<br/>  })</pre> | `{}` | no |
| <a name="input_vault_id"></a> [vault\_id](#input\_vault\_id) | Backup vault ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_instance_id"></a> [backup\_instance\_id](#output\_backup\_instance\_id) | The ID of the created Data Protection Backup Instance |
| <a name="output_backup_instance_name"></a> [backup\_instance\_name](#output\_backup\_instance\_name) | The name of the created Data Protection Backup Instance |
<!-- END_TF_DOCS -->
