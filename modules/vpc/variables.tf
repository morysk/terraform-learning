# private subnet linked with azs and cidr block
variable "priv_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    priv_1 = {
      cidr = "10.0.2.0/24"
      az   = "eu-west-2b"
    }
    priv_2 = {
      cidr = "10.0.3.0/24"
      az   = "eu-west-2c"
    }

  }
}

# VPC CIDR Block

variable "vpc_cidr" {
  description = "vpc cidr block"
  type        = string
}

# Public subnet CIDR Block

variable "pub_cidr" {
  description = "public subnet cidr block"
  type        = string
}

variable "pub_az" {
  description = "public subnet availability zone"
  type        = string
}
