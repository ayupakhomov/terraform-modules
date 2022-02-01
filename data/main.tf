data "archive_file" "lambda_instances" {
  type             = "zip"
  source_file      = "code/lambda.py"
  output_file_mode = "0666"
  output_path      = "code/lambda.zip"
}