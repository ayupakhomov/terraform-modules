data "aws_route53_zone" "this" {
  count = var.create_route53_record ? 1 : 0
  #provider = aws.route53
  name         = var.route53_domain_name
  private_zone = false
}

resource "aws_route53_record" "this" {
  #provider = aws.route53
  count = var.create_route53_record ? 1 : 0
  zone_id = data.aws_route53_zone.this[0].zone_id
  name    = var.api_route53_record
  type    = "A"
  
  alias {
    name                   = var.api_gateway_domain_name_regional_domain_name
    zone_id                = var.api_gateway_domain_name_regional_zone_id
    evaluate_target_health = true
  }
}