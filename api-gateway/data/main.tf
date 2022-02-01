data "aws_s3_bucket_object" "this" {
  bucket = var.bucket_name
  key    = var.api_gateway_defenition_file
}

data "aws_route53_zone" "this" {
  name         = var.route_53_domain_name
  private_zone = false
}