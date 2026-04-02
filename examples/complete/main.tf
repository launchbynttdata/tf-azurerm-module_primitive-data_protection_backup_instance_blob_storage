// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "resource_names" {
  source  = "terraform.registry.launch.nttdata.com/module_library/resource_name/launch"
  version = "~> 2.0"

  for_each = var.resource_names_map

  region                  = join("", split("-", var.location))
  class_env               = var.class_env
  cloud_resource_type     = each.value.name
  instance_env            = var.instance_env
  instance_resource       = var.instance_resource
  maximum_length          = each.value.max_length
  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service

}

resource "random_uuid" "ra_reader" {}
resource "random_uuid" "ra_sa_backup" {}
resource "random_uuid" "ra_blob_data" {}
locals {
  sa_name = module.resource_names["storage_account"].minimal_random_suffix_without_any_separators
}
module "resource_group" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm"
  version = "~> 1.0"

  name     = module.resource_names["resource_group"].standard
  location = var.location

  tags = merge(var.tags, { resource_name = module.resource_names["resource_group"].standard })
}
module "backup_storage_reader" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/role_assignment/azurerm"
  version = "~> 1.2.1"

  name                 = random_uuid.ra_reader.result
  scope                = module.storage_account.id
  role_definition_name = "Reader"
  principal_id         = module.backup_vault.identity[0].principal_id
  principal_type       = "ServicePrincipal"

  depends_on = [
    module.storage_account,
    module.backup_vault
  ]
}
module "vault_storage_backup_contributor" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/role_assignment/azurerm"
  version = "~> 1.0"

  name                 = random_uuid.ra_sa_backup.result
  scope                = module.storage_account.id
  role_definition_name = "Storage Account Backup Contributor"
  principal_id         = module.backup_vault.identity[0].principal_id
  principal_type       = "ServicePrincipal"

  depends_on = [
    module.storage_account,
    module.storage_container,
    module.backup_vault
  ]
}
module "vault_blob_contributor" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/role_assignment/azurerm"
  version = "~> 1.0"

  name                 = random_uuid.ra_blob_data.result
  scope                = module.storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.backup_vault.identity[0].principal_id
  principal_type       = "ServicePrincipal"

  depends_on = [
    module.storage_account,
    module.storage_container,
    module.backup_vault
  ]
}

module "storage_account" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/storage_account/azurerm"
  version = "~> 1.3.2"

  storage_account_name = local.sa_name
  resource_group_name  = module.resource_group.name
  location             = var.location
  depends_on = [
    module.resource_group
  ]
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  enable_https_traffic_only     = true
  public_network_access_enabled = true

  # Azure Backup enables these on protected storage accounts; pinning retention avoids second-apply drift.
  blob_versioning_enabled            = true
  blob_change_feed_enabled           = true
  blob_change_feed_retention_in_days = 7

  tags = merge(var.tags, { resource_name = module.resource_names["storage_account"].standard })
}

module "storage_container" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/storage_container/azurerm"
  version = "~> 1.0"

  name                 = "backupcontainer"
  storage_account_name = local.sa_name

  container_access_type = "private"

  depends_on = [
    module.storage_account
  ]
}
module "backup_vault" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/data_protection_backup_vault/azurerm"
  version = "~> 0.1.1"

  name                = module.resource_names["backup_vault"].standard
  resource_group_name = module.resource_group.name
  location            = var.location

  datastore_type = "VaultStore"
  redundancy     = "LocallyRedundant"
  soft_delete    = "Off"
  identity = {
    type = "SystemAssigned"
  }
  depends_on = [
    module.resource_group
  ]

  tags = {
    resource_name = module.resource_names["backup_vault"].standard
  }
}

module "backup_policy_blob_storage" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/data_protection_backup_policy_blob_storage/azurerm"
  version = "~> 1.0"

  policy_name                      = module.resource_names["backup_policy_blob_storage"].standard
  vault_id                         = module.backup_vault.vault_id
  backup_repeating_time_intervals  = ["R/2024-01-01T02:00:00+00:00/P1D"]
  vault_default_retention_duration = "P30D"
  time_zone                        = "UTC"

  retention_rules = []
  depends_on = [
    module.backup_vault
  ]
}
resource "time_sleep" "wait_for_rbac" {
  depends_on = [
    module.backup_storage_reader,
    module.vault_blob_contributor,
    module.vault_storage_backup_contributor
  ]

  create_duration = "300s"
}
module "backup_instance_blob_storage" {
  source = "../../"

  name                            = module.resource_names["backup_instance_blob_storage"].standard
  location                        = var.location
  storage_account_container_names = [module.storage_container.name]
  timeouts                        = var.timeouts

  storage_account_id = module.storage_account.id
  vault_id           = module.backup_vault.vault_id
  backup_policy_id   = module.backup_policy_blob_storage.id

  depends_on = [
    module.backup_policy_blob_storage,
    module.storage_container,
    time_sleep.wait_for_rbac
  ]
}
