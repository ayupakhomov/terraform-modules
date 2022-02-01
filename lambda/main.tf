
resource "aws_lambda_function" "lambda_instances" {
  filename         = var.zip_path
  function_name    = var.function_name
  role             = "arn:aws:iam::298049454812:role/ghost_app_role"
  handler          = "${var.function_name}.lambda_handler"
  source_code_hash = var.zip_path_source_code_hash
  timeout          = "60"
  runtime          = "python3.8"
  environment {
    variables = {
      sqs_queue_url  = var.sqs_queue_url

    }
  }
}