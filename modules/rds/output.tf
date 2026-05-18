# RDS instance outputs 

output "rds_id" {
  description = "ID of RDS instance"
  value       = aws_db_instance.rds_wp.id
}

output "rds_name" {
  description = "name of rds instance"
  value       = aws_db_instance.rds_wp.db_name
}

output "rds_sg_id" {
  description = "RDS security group id"
  value       = aws_security_group.rds_sg.id
}

output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.rds_wp.endpoint
}

output "db_host" {
  description = "rds address to allow ec2 to connect to rds database"
  value       = aws_db_instance.rds_wp.address
}
