# We need add a provider to use
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.96.0"
    }
  }
}

# Initialize the provider
provider "azurerm" {
  features {
    
  }
}

terraform{
    backend "azurerm" {
        resource_group_name = "AzureResourceGroupCreation"
        storage_account_name = "tfstorageforstate"
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}

variable "imagebuild"{
    type = string
    description = "The latest build version"
}

# We are creating a group resource
#  resource "azurerm_resource_group" "AzureResourceGroupCreation" {
#  name     = "AzureResourceGroupCreation"
#  location = "Central India"
# }

# Create the container group
resource "azurerm_container_group" "tf_cg_sampleapi"{
    name = "cg_sampleapi"
    location = azurerm_resource_group.AzureResourceGroupCreation.location
    resource_group_name = azurerm_resource_group.AzureResourceGroupCreation.name
    
    ip_address_type = "public"
    dns_name_label = "sampleapitfs"
    os_type = "Linux"

    container{
        name = "sampleapi"
        image = "rahulk86/sampleapi: ${var.imagebuild}"
        cpu = "1"
        memory = "1"
        ports{
            port = 80
            protocol = "TCP"
        }
    }
}