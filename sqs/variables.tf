variable "q1_name" {
    type = string
    default = ""
}

variable "q1_delay_seconds" {
    type = number
    default = 10
}

variable "q1_max_message_size" {
    type = number
    default = 204800
}

variable "q1_message_retention_seconds" {
    type = number
    default = 86400
}

variable "q1_receive_wait_time_seconds" {
    type = number
    default = 10
}

variable "q1_visibility_timeout_seconds" {
    type = number
    default = 600
}

variable "q2_name" {
    type = string
    default = ""
}

variable "q2_delay_seconds" {
    type = number
    default = 10
}

variable "q2_max_message_size" {
    type = number
    default = 204800
}

variable "q2_message_retention_seconds" {
    type = number
    default = 86400
}

variable "q2_receive_wait_time_seconds" {
    type = number
    default = 10
}

variable "q2_visibility_timeout_seconds" {
    type = number
    default = 300
}


