output "backup_instance_blob_storage_id" {
  value = module.backup_instance_blob_storage.backup_instance_id
}

output "storage_account_id" {
  value = module.storage_account.id
}

output "backup_vault_id" {
  value = module.backup_vault.vault_id
}

output "backup_policy_blob_storage_id" {
  value = module.backup_policy_blob_storage.id
}
