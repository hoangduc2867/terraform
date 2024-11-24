resource "aws_db_instance" "mysql_instance" {
  identifier        = var.project
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.rds_instance_class
  allocated_storage = 30 
  db_name           = var.db_name
  username          = var.username
  password          = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot = true
  
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [var.sg_db_id]  
  multi_az = false 
  
  publicly_accessible = false 
  storage_type        = "gp2"
  storage_encrypted   = true 
  
  tags = {
    Name = var.project
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.project}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project}-db-subnet-group"
  }
}