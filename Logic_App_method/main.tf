## This module contains the provisioning code for Azure APIM and Azure Logic Apps

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
resource "azurerm_resource_group" "testrg" {
  name     = "Deloitte-Test-RG-01"
  location = "eastus"
}

###################################################### APIM #####################################################

# Create Azure API management service
resource "azurerm_api_management" "testapim" {
  name                = "Deloitte-Test-APIM-01"
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name
  publisher_name      = "Test"
  publisher_email     = "test@gmail.com"

  sku_name = var.sku_name
}

# Create Azure API service
resource "azurerm_api_management_api" "fnr" {
  resource_group_name = azurerm_resource_group.testrg.name
  api_management_name = azurerm_api_management.testapim.name
  name         = "findandreplace"
  display_name = "FindandReplace"
  description  = "API for Find and Replace string problem statement"
  path         = "findandreplace"
  protocols    = ["https"]
  import {
    content_format   = var.open_api_spec_content_format
    //content_value  = var.open_api_spec_content_format == "openapi-link" ? format("%s/%s", var.open_api_spec_content_value_url, "Api-spec.yaml") : file(format("%s/%s", path.cwd, "Terraform/Logic_App_method/templates/Api-spec.yaml"))
    content_value    = file(var.api_spec_path)
  }
  subscription_required = false
}

resource "azurerm_api_management_api_policy" "fnr-api-policy" {
  api_name            = azurerm_api_management_api.fnr.name
  api_management_name = azurerm_api_management.testapim.name
  resource_group_name = azurerm_resource_group.testrg.name
  xml_content         = file(var.api_policy_path)
}
###################################################### Logic App #####################################################

##Create an instance of logic app and configure the tags
resource "azurerm_logic_app_workflow" "logicapp" {
  name                = "Deloitte-Test-Lapp-01"
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name
}

## Deploy the ARM template to configure the workflow in the Logic App

resource "azurerm_template_deployment" "logicapp" {
  name                = "Deloitte-Test-Lapp-01"
  depends_on          = [azurerm_logic_app_workflow.logicapp]
  resource_group_name = azurerm_resource_group.testrg.name
  template_body       = file(var.lapp_arm_template_path)
  parameters_body     = file(var.lapp_arm_paramaters_path)
  deployment_mode     = "Incremental"
}