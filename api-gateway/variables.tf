variable "create_api_gateway" {
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

variable "domain_name" {
  description = "The domain name to use for API gateway"
  type        = string
  default     = null
}

variable "domain_name_certificate_arn" {
  description = "The ARN of an AWS-managed certificate that will be used by the endpoint for the domain name"
  type        = string
  default     = null
}