variable "subscription_id" {
  description = "Azure Subscription id"
  type        = string
}

variable "tenant_id" {
  description = "Azure Subscription id"
  type        = string
}

variable "open_api_spec_content_format" {
  description = "The format of the content from which the API Definition should be imported. Possible values are: openapi, openapi+json, openapi+json-link, openapi-link, swagger-json, swagger-link-json, wadl-link-json, wadl-xml, wsdl and wsdl-link."
  //default     = "openapi-link"
  default = "openapi"
}

variable "open_api_spec_content_value_url" {
  description = "The Content from which the API Definition should be imported. When a content_format of *-link-* is specified this must be a URL, otherwise this must be defined inline."
  default     = "https://.../Api-spec.yaml"
}

variable "sku_name" {
  description = "Sku name for Azure API management"
  type        = string
  default     = "Developer_1"
}

variable "api_spec_path" {
  description = "openapi specifications details for the API"
  type        = string
}

variable "api_policy_path" {
  description = "policy details for the API"
  type        = string
}

variable "lapp_arm_template_path" {
  description = "logic app ARM template file"
  type        = string
}

variable "lapp_arm_paramaters_path" {
  description = "logic app ARM parameters file"
  type        = string
}