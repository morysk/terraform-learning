# Private subnets to host rds instance

variable "priv_subnet_ids" {
  type = list(string)
}

# RDS instance 

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type = string
}

variable "vpc_id" {
  type = string
}

# ec2 security group id

variable "ec2_sg_id" {
  type = string
}
