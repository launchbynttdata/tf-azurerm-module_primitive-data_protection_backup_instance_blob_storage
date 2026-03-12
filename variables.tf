variable "name" {
  type        = string
  description = "Name of the Backup Instance"
}

variable "location" {
  type        = string
  description = "Location of the storage account"
}

variable "vault_id" {
  type        = string
  description = "Backup vault ID"
}

variable "storage_account_id" {
  type        = string
  description = "Storage account ID"
}

variable "backup_policy_id" {
  type        = string
  description = "Backup policy ID"
}
variable "storage_account_container_names" {
  description = "List of blob containers to protect"
  type        = list(string)
}
