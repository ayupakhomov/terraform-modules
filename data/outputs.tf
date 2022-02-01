output "archive_file" {
  description = "path to lambda function zip file"
  value       = data.archive_file.lambda_instances.output_path
}

output "archive_file_hash" {
  description = "hash"
  value       = data.archive_file.lambda_instances.output_base64sha256
}