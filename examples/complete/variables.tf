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

variable "resource_names_map" {
  description = "A map of key to resource_name that will be used by tf-launch-module_library-resource_name to generate resource names"
  type = map(object({
    name       = string
    max_length = optional(number, 60)
  }))

  default = {
    resource_group = {
      name       = "rg"
      max_length = 80
    }

    storage_account = {
      name       = "sa"
      max_length = 80
    }

    backup_vault = {
      name       = "bv"
      max_length = 80

    }
    backup_instance_blob_storage = {
      name       = "bibs"
      max_length = 80

    }
    backup_policy_blob_storage = {
      name       = "bpbs"
      max_length = 80

    }
  }
}

variable "location" {
  description = "Azure region used for all example resources"
  type        = string
}

variable "class_env" {
  description = "Class environment segment for generated resource names"
  type        = string
}

variable "instance_env" {
  description = "Instance environment segment for generated resource names"
  type        = string
}

variable "instance_resource" {
  description = "Instance resource segment for generated resource names"
  type        = string
}

variable "logical_product_family" {
  description = "Logical product family segment for generated resource names"
  type        = string
}

variable "logical_product_service" {
  description = "Logical product service segment for generated resource names"
  type        = string
}

variable "tags" {
  description = "Tags applied to all example resources"
  type        = map(string)
  default     = {}
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
