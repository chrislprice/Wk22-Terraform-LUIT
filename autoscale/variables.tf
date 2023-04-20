variable "ami_id" {
  description = "AMI used for the webserver"
  type        = string
  default     = "ami-069aabeee6f53e7bf"
}

variable "instance_type" {
  description = "Instance type used for webserver"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  type    = string
  default = "enter keypair name"
}

variable "security_group" {
  type = list(string)
}

variable "asg_group_name" {
  type    = string
  default = "Apache Terra Group"
}

variable "asg_min_value" {
  type    = number
  default = 3
}

variable "asg_max_value" {
  type    = number
  default = 5
}

variable "vpc_zone_identifier" {
  type = list(any)
}


