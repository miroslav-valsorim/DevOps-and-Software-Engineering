terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "StorageRG"
    storage_account_name = "taskboardstorage"
    container_name       = "taskboardcontainer"
    key                  = "terraform.tfstate"
  }
}

# the other steps from ex3/ex3.1