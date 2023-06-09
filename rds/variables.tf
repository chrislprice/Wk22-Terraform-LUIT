#variables
variable "database_subnet_name" {
  default = "mysql-database-subnet"
  type    = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "allocated_storage" {
  type    = number
  default = 30
}

variable "engine" {
  type    = string
  default = "MySQL"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"

}
variable "vpc_security_group_ids" {
  type = list(string)
}

variable "db_name" {
  type    = string
  default = "TestDB"
}
variable "username" {
  type    = string
  default = "enter username"
}
variable "password" {
  type    = string
  default = "enter a password"
}

variable "allow_major_version_upgrade" {
  type    = bool
  default = "true"
}
variable "auto_minor_version_upgrade" {
  type    = bool
  default = "true"
}



