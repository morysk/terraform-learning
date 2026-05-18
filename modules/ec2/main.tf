### EC2 instance ####

resource "aws_instance" "wp_ec2" {
  ami                         = var.ec2_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name
  subnet_id                   = var.pub_subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]


  user_data = templatefile("${path.root}/userdata.sh", {
    db_name     = var.db_name
    db_username = var.db_user
    db_password = var.db_password
    db_host     = var.db_host
  })

  tags = {
    Name = "wp_instance"
  }
}

# SECURITY GROUP #
## EC2 security group 
resource "aws_security_group" "ec2_sg" {
  name        = "wordpress_sg"
  description = "Allow TLS inbound traffic (HTTP/HTTPS, SSH) and all outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
