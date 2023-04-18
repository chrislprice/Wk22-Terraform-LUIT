module "vpc" {
  source = "./vpc"
}

module "sg_group" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id
}

module "auto_scale" {
  source              = "./autoscale"
  security_group      = [module.sg_group.sgid]
  vpc_zone_identifier = [module.vpc.public-subnet1, module.vpc.public-subnet2]
}

module "rds" {
  source             = "./rds"
  private_subnet_ids = [module.vpc.private-subnet1, module.vpc.private-subnet2]
  allocated_storage  = 30
  engine             = "MySQL"
  instance_class     = "db.t3.micro"
  # vpc_security_group_ids      = [var.vpc_security_group_ids]
  db_name                     = "TestDB"
  allow_major_version_upgrade = "true"
  auto_minor_version_upgrade  = "true"
}