variable "zip_path" {
    type = string
    default = ""
}

variable "function_name" {
    type = string
    default = "lambda"
}

variable "zip_path_source_code_hash" {
    type = string
    default = ""
}

variable "sqs_queue_url" {
    type = string
    default = ""
}