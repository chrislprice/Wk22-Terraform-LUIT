
variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc-cidr-block" {
  type    = string
  default = "10.10.0.0/16"
}


variable "vpc-name" {
  type    = string
  default = "my-vpc"
}


variable "public-subnet1-cidr" {
  type    = string
  default = "10.10.1.0/24"
}


variable "public-subnet1-name" {
  type    = string
  default = "my-public-subnet1"
}


variable "public-subnet2-cidr" {
  type    = string
  default = "10.10.2.0/24"
}


variable "public-subnet2-name" {
  type    = string
  default = "my-public-subnet2"
}



variable "private-subnet1-cidr" {
  type    = string
  default = "10.10.3.0/24"
}


variable "private-subnet1-name" {
  type    = string
  default = "my-private-subnet1"
}


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
