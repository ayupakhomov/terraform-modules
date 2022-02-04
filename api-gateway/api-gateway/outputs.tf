output "api_gateway_domain_name_regional_domain_name" {
  value = try(aws_api_gateway_domain_name.this[0].regional_domain_name, "")
}

output "api_gateway_domain_name_regional_regional_zone_id" {
  value = try(aws_api_gateway_domain_name.this[0].regional_zone_id, "")
}