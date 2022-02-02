variable "mapped_domain_gateway_type" {
  type    = string
  default = ""
}

variable "api_gateway_mapped_domain_name" {
  type    = string
  default = ""
}

variable "domain_name_certificate_arn" {
  type    = string
  default = ""
}

variable "create_route53_record" {
  type    = bool
  default = false
}

variable "route53_zone_id" {
  type    = string
  default = ""
}

variable "api_route53_record" {
  type    = string
  default = ""
}
