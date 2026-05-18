module "ec2" {
  source = "./modules/ec2"

  ec2_ami       = var.ec2_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_id        = module.vpc.vpc_id
  pub_subnet_id = module.vpc.public_sub_id

  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
  db_host     = module.rds.db_host
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id

  db_name     = var.db_name
  db_password = var.db_password
  db_user     = var.db_user

  ec2_sg_id       = module.ec2.ec2_sg_id
  priv_subnet_ids = module.vpc.priv_subnet_id
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  pub_az   = var.pub_az
  pub_cidr = var.pub_cidr
}
