variable "create_api_gateway" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_api_gateway_stage" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_api_gateway_deployment" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_api_gateway_base_path_mapping" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_api_gateway_domain_name" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_route53_record" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_api_gateway_usage_plan" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_api_gateway_api_key" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}


variable "create_api_gateway_usage_plan_key" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}


variable "api_gateway_name" {
  type    = string
  default = ""
}

variable "api_gateway_type" {
  type    = string
  default = "REGIONAL"
}

variable "body" {
  description = "An OpenAPI specification."
  type        = string
  default     = null
}

variable "api_gateway_stage_name" {
  type    = string
  default = ""
}

variable "tags" {
  description = "A mapping of tags to assign to API gateway resources."
  type        = map(string)
  default     = {}
}

variable "default_stage_tags" {
  description = "A mapping of tags to assign to the default stage resource."
  type        = map(string)
  default     = {}
}

variable "stage_variables" {
  description = "A mapping of variables to assign to the stages"
  type        = map(string)
  default     = {}
}

variable "domain_name_certificate_arn" {
  description = "The ARN of an AWS-managed certificate that will be used by the endpoint for the domain name"
  type        = string
  default     = null
}

variable "api_gateway_mapped_domain_name" {
  type    = string
  default = ""
}




variable "api_gateway_usage_plan_description" {
  type    = string
  default = ""
}

variable "api_gateway_usage_plan_name" {
  type    = string
  default = ""
}

variable "api_gateway_api_key_name" {
  type    = string
  default = ""
}

variable "api_mapping_base_path" {
  type    = string
  default = ""
}