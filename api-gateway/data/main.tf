data "aws_s3_bucket_object" "this" {
  bucket = var.bucket_name
  key    = var.api_gateway_defenition_file
}