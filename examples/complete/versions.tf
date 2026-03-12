terraform {
  required_version = "~> 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.117"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}
