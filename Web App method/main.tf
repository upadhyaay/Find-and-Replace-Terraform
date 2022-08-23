## This module contains the provisioning code for App service plan and web app

# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}


# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = "Deloitte-Test-RG-02"
  location = "eastus"
}

# Create the Windows App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "FindandReplace-ASP-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
 sku {
    tier = var.asp_tier
    size = "S1"
  }
  }

# Create the web app, pass in the App Service Plan ID
resource "azurerm_windows_web_app" "webapp" {
  name                  = "FindandReplace-webapp-01"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  https_only            = true
  site_config { 
    minimum_tls_version = "1.2"
  }
}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_windows_web_app.webapp.id
  repo_url           = var.repo_url
  branch             = "master"
  use_manual_integration = true
  use_mercurial      = false
}