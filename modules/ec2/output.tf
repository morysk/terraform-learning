# EC2 instance outputs 

output "instance_id" {
  description = "wordpress ec2 instance id"
  value       = aws_instance.wp_ec2.id
}

output "instance_ip" {
  description = "public ip address of wordpress instance"
  value       = aws_instance.wp_ec2.public_ip
}

output "ec2_sg_id" {
  description = "security group id of the ec2 instance"
  value       = aws_security_group.ec2_sg.id
}
