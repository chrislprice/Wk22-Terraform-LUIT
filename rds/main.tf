#Creates database subnet group
resource "aws_db_subnet_group" "database_subnet_name" {
  name       = var.database_subnet_name
  subnet_ids = var.private_subnet_ids
}

#Create RDS Instance
resource "aws_db_instance" "db_instance" {
  allocated_storage           = var.allocated_storage
  engine                      = var.engine
  instance_class              = var.instance_class
  db_subnet_group_name        = var.database_subnet_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  db_name                     = var.db_name
  username                    = var.username
  password                    = var.password
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  multi_az                    = "true"
  skip_final_snapshot         = "true"
  depends_on = [aws_db_subnet_group.database_subnet_name]#waits until subnet is completed
  #if not, causes error duing deployment
}