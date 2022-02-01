output "lambda_arn" {
  value = try(aws_lambda_function.lambda_instances.arn, "")
}