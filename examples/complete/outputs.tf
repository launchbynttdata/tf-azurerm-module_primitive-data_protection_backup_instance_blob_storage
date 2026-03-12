output "backup_instance_blob_storage_id" {
  value = module.backup_instance_blob_storage.backup_instance_id
}

output "backup_instance_blob_storage_name" {
  description = "Name of the Backup Instance (Blob Storage)"
  value       = module.resource_names["backup_instance_blob_storage"].standard
}

output "storage_account_id" {
  value = module.storage_account.id
}

output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = local.sa_name
}

# Optional: for compatibility with some storage-account terratests that expect `name`
output "name" {
  description = "Alias for storage_account_name (used by some terratests)"
  value       = local.sa_name
}

output "backup_vault_id" {
  value = module.backup_vault.vault_id
}

output "backup_vault_name" {
  description = "Name of the Backup Vault"
  value       = module.backup_vault.vault_name
}

output "backup_policy_blob_storage_id" {
  value = module.backup_policy_blob_storage.id
}

output "resource_group_name" {
  value = module.resource_group.name
}
