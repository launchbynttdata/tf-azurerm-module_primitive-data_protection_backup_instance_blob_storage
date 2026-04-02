variable "name" {
  type        = string
  description = "Name of the Backup Instance"
}

variable "location" {
  type        = string
  description = "Location of the backup instance (must match backup vault location)"
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
  default     = null
}

variable "timeouts" {
  description = "Configurable timeouts for backing up and restoring the Backup Instance"
  type = object({
    create = optional(string, "30m")
    read   = optional(string, "5m")
    update = optional(string, "30m")
    delete = optional(string, "30m")
  })
  default = {}
}
