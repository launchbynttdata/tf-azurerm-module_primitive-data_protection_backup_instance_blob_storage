output "backup_instance_id" {
  description = "The ID of the created Data Protection Backup Instance"
  value       = azurerm_data_protection_backup_instance_blob_storage.backup_instance_blob_storage.id
}

output "backup_instance_name" {
  description = "The name of the created Data Protection Backup Instance"
  value       = azurerm_data_protection_backup_instance_blob_storage.backup_instance_blob_storage.name
}
