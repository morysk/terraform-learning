### RDS SECURITY GROUP #####

resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow only inbound traffic from ec2 sg"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow mysql"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

### RDS instance ###
resource "aws_db_instance" "rds_wp" {
  allocated_storage      = 20
  db_name                = var.db_name
  engine                 = "mysql"
  engine_version         = "8.4.8"
  instance_class         = "db.t3.micro"
  username               = var.db_user     # make variable
  password               = var.db_password # make variable
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]           # associate rds security group with db instance
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name # DB instance will be created in the VPC associated with the DB subnet group
}

## subnet group associated with rds ##

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "priv_subnets"
  subnet_ids  = var.priv_subnet_ids
  description = "subnets for rds database instance"

  tags = {
    Name = "My_DB_subnet_group"
  }
}
