variable "http_port" {
  type        = number
  description = "HTTP port"
  default     = 80
}

variable "ssh_port" {
  type        = number
  description = "SSH port for connectivity"
  default     = 22
}

variable "cidr_ingress_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "vpc_id" {
  type = string
}