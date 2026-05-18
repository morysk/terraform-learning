# output variables for vpc

output "vpc_id" {
  description = "ID of the vpc"
  value       = module.vpc.vpc_id
}

# EC2 instance outputs 

output "instance_id" {
  description = "wordpress ec2 instance id"
  value       = module.ec2.instance_id
}

output "instance_ip" {
  description = "public ip address of wordpress instance"
  value       = module.ec2.instance_ip
}

# RDS instance outputs 


output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = module.rds.rds_endpoint
}
