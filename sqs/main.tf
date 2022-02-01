
resource "aws_sqs_queue" "q1" { 
  name                       = var.q1_name
  delay_seconds              = var.q1_delay_seconds
  max_message_size           = var.q1_max_message_size
  message_retention_seconds  = var.q1_message_retention_seconds
  receive_wait_time_seconds  = var.q1_receive_wait_time_seconds
  visibility_timeout_seconds = var.q1_visibility_timeout_seconds
}

resource "aws_sqs_queue" "q2" {
  name                       = var.q2_name
  delay_seconds              = var.q2_delay_seconds
  max_message_size           = var.q2_max_message_size
  message_retention_seconds  = var.q2_message_retention_seconds
  receive_wait_time_seconds  = var.q2_receive_wait_time_seconds
  visibility_timeout_seconds = var.q2_visibility_timeout_seconds
}
