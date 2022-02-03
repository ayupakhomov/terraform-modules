data "aws_route53_zone" "this" {
  name         = var.route_53_domain_name
  private_zone = false
}