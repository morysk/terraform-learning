# vpc and public subnet id

variable "vpc_id" {
  type = string
}

variable "pub_subnet_id" {
  type = string
}

# EC2 Instance

variable "ec2_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

# RDS instance details passed into userdata

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_host" {
  type = string
}
