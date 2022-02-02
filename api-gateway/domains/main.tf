resource "aws_api_gateway_domain_name" "this" {
  count = var.create_api_gateway_domain_name ? 1 : 0
    domain_name              = var.api_gateway_mapped_domain_name
    regional_certificate_arn = var.domain_name_certificate_arn
    security_policy          = "TLS_1_2"
    endpoint_configuration {
        types = [
            var.mapped_domain_gateway_type,
        ]
    }
}

resource "aws_route53_record" "this" {
  count = var.create_route53_record ? 1 : 0
  zone_id = var.route53_zone_id
  name    = var.api_gateway_mapped_domain_name
  type    = "A"
  
  alias {
    name                   = aws_api_gateway_domain_name.this[0].regional_domain_name
    zone_id                = aws_api_gateway_domain_name.this[0].regional_zone_id
    evaluate_target_health = true
  }
}