output "backup_instance_id" {
  value = azurerm_data_protection_backup_instance_blob_storage.backup_instance_blob_storage.id
}

output "backup_instance_name" {
  value = azurerm_data_protection_backup_instance_blob_storage.backup_instance_blob_storage.name
}
