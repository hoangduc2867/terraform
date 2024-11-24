#########################################
# Runner
#########################################
resource "aws_instance" "runner" {
  ami           = var.runner_ami_id 
  instance_type = var.runner_instance_type
  subnet_id     = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.sg_runner_id]
  key_name      = var.key_name

  associate_public_ip_address = true

  // User data
  user_data = filebase64("install-package-api-server.sh")
  
  // Edit the root block device 
  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  tags = {
    Name = var.runner_instance_name
    Environment = var.environment
    Project = var.project
  }
}
#########################################
# Bastion
#########################################
resource "aws_instance" "bastion" {
  ami           = var.bastion_ami_id 
  instance_type = var.bastion_instance_type
  subnet_id     = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.sg_bastion_id]
  key_name      = var.key_name

  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }
  
  tags = {
    Name = var.bastion_instance_name
    Environment = var.environment
    Project = var.project
  }
}
#########################################
# Monitor
#########################################
resource "aws_instance" "monitor" {
  ami           = var.monitor_ami_id
  instance_type = var.monitor_instance_type
  subnet_id     = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.sg_bastion_id]
  key_name      = var.key_name

  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }
  
  tags = {
    Name = var.monitor_instance_name
    Environment = var.environment
    Project = var.project
  }
}

#########################################
# API
#########################################
resource "aws_launch_template" "api" {
  name_prefix   = "dev-api"
  image_id      = var.api_ami_id
  instance_type = var.api_instance_type
  key_name = var.key_name
  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.sg_api_id]
  }

  // User data
  user_data = filebase64("install-package-api-server.sh")
  
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 30
      volume_type = "gp2"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.api_instance_name
      Environment = var.environment
      Project = var.project
    }
  }
}
resource "aws_autoscaling_group" "api" {
  name                = "api-asg"
  vpc_zone_identifier = var.private_subnet_ids
  min_size            = 1
  max_size            = 2
  desired_capacity    = 1

  launch_template {
    id      = aws_launch_template.api.id
    version = "$Latest"
  }
}