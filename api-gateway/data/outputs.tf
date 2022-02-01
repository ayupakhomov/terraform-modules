output "api_gateway_defenition_file_body" {
  value = try(data.aws_s3_bucket_object.this.body, "")
}

output "route_53_zone_id" {
  value = try(data.aws_route53_zone.this.zone_id, "")
}