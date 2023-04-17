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