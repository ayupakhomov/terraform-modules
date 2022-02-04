data "aws_route53_zone" "this" {
  #provider = aws.route53
  name         = var.route_53_domain_name
  private_zone = false
}