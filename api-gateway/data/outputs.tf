output "api_gateway_defenition_file_body" {
  value = try(data.aws_s3_bucket_object.this.body, "")
}