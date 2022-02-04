variable "create_route53_record" {
  type    = bool
  default = false
}

variable "api_route53_record" {
  type    = string
  default = ""
}

variable "route53_domain_name" {
  type    = string
  default = ""
}

variable "api_gateway_domain_name_regional_domain_name" {
  type    = string
  default = ""
}

variable "api_gateway_domain_name_regional_regional_zone_id" {
  type    = string
  default = ""
}