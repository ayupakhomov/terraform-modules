output "q1_url" {
  value = try(aws_sqs_queue.q1.url, "")
}

output "q2_url" {
  value = try(aws_sqs_queue.q2.url, "")
}