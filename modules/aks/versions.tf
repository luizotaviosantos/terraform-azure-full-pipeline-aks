terraform {
 required_version = "~> 1.3.6"
 required_providers {
  azurerm = {
   source = "hashicorp/azurerm"
   version = "~> 3.21.0"
  }

  azuread = {
   source  = "hashicorp/azuread"
   version = "~> 1.0"
  }

  random = {
   source  = "hashicorp/random"
   version = "~> 3.0"
  }


  kubectl = {
   source = "gavinbunney/kubectl"
   version = "1.14.0"
  }
 }
}