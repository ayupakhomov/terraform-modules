data "aws_route53_zone" "this" {
  #provider = aws.route53
  name         = var.route_53_domain_name
  private_zone = false
}

resource "aws_route53_record" "this" {
  #provider = aws.route53
  count = var.create_route53_record ? 1 : 0
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.api_route53_record
  type    = "A"
  
  alias {
    name                   = var.var.api_gateway_domain_name_regional_regional_zone_id
    zone_id                = var.api_gateway_domain_name_regional_regional_zone_id
    evaluate_target_health = true
  }
}