variable "create_api_gateway" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_api_gateway_usage_plan" {
  description = "Whether to create a Usage Plan for API Gateway"
  type        = bool
  default     = true
}

variable "create_api_gateway_api_key" {
  description = "Whether to create API Keys"
  type        = bool
  default     = true
}

variable "create_api_gateway_domain_name" {
  description = "Whether to create a Custom Domain Name for API Gateway"
  type        = bool
  default     = true
}

variable "api_gateway_params" {
  description = "All the parameters of API Gateway"
  type    = list(map(string))
  default = []
}

# variable "api_gateway_name" {
#   description = "Name of API Gateway"
#   type    = list
#   default = []
# }

# variable "api_gateway_defenition_file_name" {
#   description = "Name of the object in S3 Bucket"
#   type    = list
#   default = null
# }

variable "api_gateway_type" {
  description = "Type of API Gateway"
  type    = string
  default = "REGIONAL"
}


variable "api_gateway_stage_name" {
  description = "Name of API Gateway Stage"
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

# variable "stage_variables" {
#   description = "A list of variables to assign to the stages"
#   type        = list(map(string))
#   default     = null
# }

variable "api_gateway_mapped_domain_name" {
  description = "FQDN of API Gateway Custom Domain"
  type    = string
  default = ""
}

variable "api_gateway_mapped_domain_gateway_type" {
  description = "Endpoint type for a Custom Domain"
  type    = string
  default = ""
}

variable "api_gateway_domain_name_certificate_arn" {
  description = "ARN of TLS Certificate for a Custom Domain"
  type    = string
  default = ""
}

variable "api_gateway_usage_plan_description" {
  description = "A description for usage plan"
  type    = string
  default = ""
}

variable "api_gateway_usage_plan_name" {
  description = "Name for a Usage Plan"
  type    = string
  default = ""
}

variable "api_gateway_api_key_name" {
  description = "Name of an API Key"
  type    = string
  default = ""
}

# variable "api_mapping_base_path" {
#   description = "Base path for Custom Domain mapping"
#   type    = list
#   default = null
# }

variable "bucket_name" {
  description = "Name of bucket where OAPI definitions are stored"
  type    = string
  default = ""
}

## Usage Plan variables ##
variable "api_gateway_usage_plan_quota_settings_limit" {
  type    = number
  default = null
}

variable "api_gateway_usage_plan_quota_settings_offset" {
  type    = number
  default = null
}

variable "api_gateway_usage_plan_quota_settings_period" {
  type    = string
  default = ""
}

variable "api_gateway_usage_plan_throttle_settings_burst_limit" {
  type    = number
  default = null
}

variable "api_gateway_usage_plan_throttle_settings_rate_limit" {
  type    = number
  default = null
}