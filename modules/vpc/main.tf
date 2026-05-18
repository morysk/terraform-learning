# VPC
resource "aws_vpc" "wordpress_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "wpc_vpc"
  }
}

# SUBNETS
## subnet inside vpc ##
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.wordpress_vpc.id
  cidr_block              = var.pub_cidr
  availability_zone       = var.pub_az
  map_public_ip_on_launch = true # instances will get a public ip

  tags = {
    Name = "pub_subnet"
  }
}

## private subnet
resource "aws_subnet" "priv_subnet" {
  for_each                = var.priv_subnets
  vpc_id                  = aws_vpc.wordpress_vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = false # priv instances will not get a public ip
  tags = {
    Name = each.key
  }

}

# INTERNET GATEWAY
resource "aws_internet_gateway" "wp_igw" {
  vpc_id = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "wordpress_igw"
  }
}

# ROUTE TABLE
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.wordpress_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wp_igw.id
  }

  tags = {
    Name = "wp_rt"
  }
}

# SUBNET ASSOCIATION TO ROUTE TABLE
resource "aws_route_table_association" "rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt.id
}
