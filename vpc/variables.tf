#Define variable for the aws_region with a default value
variable "region" {
  type    = string
  default = "us-east-1"
}


#Define variable for the aws_region with a default value
variable "vpc-cidr-block" {
  type    = string
   default = "10.10.0.0/16"
}

#Define variable for the aws_region with a default value
variable "vpc-name" {
  type    = string
  default = "my-vpc"
}

#Define variable for the aws_region with a default value
variable "public-subnet1-cidr" {
  type    = string
  default = "10.10.1.0/24"
}

#Define variable for the aws_region with a default value
variable "public-subnet1-name" {
  type    = string
  default = "my-public-subnet1"
}

#Define variable for the aws_region with a default value
variable "public-subnet2-cidr" {
  type    = string
  default = "10.10.2.0/24"
}

#Define variable for the aws_region with a default value
variable "public-subnet2-name" {
  type    = string
  default = "my-public-subnet2"
}


#Define variable for the aws_region with a default value
variable "private-subnet1-cidr" {
  type    = string
  default = "10.10.3.0/24"
}

#Define variable for the aws_region with a default value
variable "private-subnet1-name" {
  type    = string
  default = "my-private-subnet1"
}

#Define variable for the aws_region with a default value
variable "private-subnet2-cidr" {
  type    = string
  default = "10.10.4.0/24"
}


variable "private-subnet2-name" {
  type    = string
  default = "my-private-subnet2"
}

variable "internet-gateway-name" {
  type    = string
  default = "my-internet-gateway"
}

variable "availability_zone1" {
  type    = string
  default = "us-east-1a"
}

variable "availability_zone2" {
  type    = string
  default = "us-east-1b"
}
