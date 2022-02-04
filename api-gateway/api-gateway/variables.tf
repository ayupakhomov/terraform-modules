variable "create_api_gateway" {
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

variable "create_api_gateway_domain_name" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "api_gateway_name" {
  type    = list
  default = []
}

variable "api_gateway_defenition_file_name" {
  type    = list
  default = null
}

variable "api_gateway_type" {
  type    = string
  default = "REGIONAL"
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


variable "api_gateway_mapped_domain_gateway_type" {
  type    = string
  default = ""
}

variable "api_gateway_domain_name_certificate_arn" {
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
  type    = list
  default = null
}

variable "bucket_name" {
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

## API Keys

variable "api_gateway_api_keys" {
  type    = map
  default = {   "key1" = "sjgd934gtu340t"
   "key2" = "8gdfogakjosgskjsod"
   "key3" = "dsgdsa8gdskg34dsg"}
}