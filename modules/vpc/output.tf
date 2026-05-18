# output variables for vpc

output "vpc_id" {
  description = "ID of the vpc"
  value       = aws_vpc.wordpress_vpc.id
}

output "public_sub_id" {
  description = "ID of public subnet"
  value       = aws_subnet.public_subnet.id
}

output "priv_subnet_id" {
  description = "IDs of private subnets"
  value       = [for subnet in aws_subnet.priv_subnet : subnet.id]
}
