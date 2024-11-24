provider "aws" {
  region = var.region
}
#########################################
# Networking
#########################################
module "Networking" {
    source = "./modules/networking"
    region = var.region
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    igw_name = var.igw_name
    public_subnet_name = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    availability_zones = var.availability_zones
}
#########################################
# Security
#########################################
module "Security" {
    source = "./modules/security"
    vpc_id = module.Networking.vpc_id
    project = var.project
}

resource "aws_key_pair" "keypair" {
  key_name = "private_demo_keypair"
  public_key = file(var.keypair_path)
}
#########################################
# Compute
#########################################
module "Compute" {
    source = "./modules/compute"
    environment = var.environment
    project = var.project
    // Subnet and Security Group
    private_subnet_ids = module.Networking.private_subnet_ids
    public_subnet_ids = module.Networking.public_subnet_ids
    sg_bastion_id = module.Security.sg_bastion_id
    sg_runner_id = module.Security.sg_runner_id
    sg_api_id = module.Security.sg_api_id
    sg_monitor_id = module.Security.sg_monitor_id
    // Key Pair
    key_name = aws_key_pair.keypair.key_name
    // Bastion
    bastion_instance_name = var.bastion_instance_name
    bastion_ami_id = var.bastion_ami_id
    bastion_instance_type = var.bastion_instance_type
    // Runner
    runner_instance_name = var.runner_instance_name
    runner_ami_id = var.runner_ami_id
    runner_instance_type = var.runner_instance_type
    // API
    api_instance_name = var.api_instance_name
    api_ami_id = var.api_ami_id
    api_instance_type = var.api_instance_type
    // Monitor
    monitor_instance_name = var.monitor_instance_name
    monitor_ami_id = var.monitor_ami_id
    monitor_instance_type = var.monitor_instance_type
}
#########################################
# Database
#########################################
module "Database" {
    source = "./modules/database"
    db_name = var.db_name
    username = var.username
    password = var.password
    project = var.project
    sg_db_id = module.Security.sg_db_id
    engine = var.engine
    engine_version = var.engine_version
    rds_instance_class = var.rds_instance_class
    parameter_group_name = var.parameter_group_name
    private_subnet_ids = module.Networking.private_subnet_ids
}
#########################################
# Load Balancing
#########################################
module "Load_Balancing" {
    source = "./modules/loadbalancing"
    vpc_id = module.Networking.vpc_id
    sg_alb_id = module.Security.sg_alb_id
    public_subnet_ids = module.Networking.public_subnet_ids
    asg_api_name = module.Compute.asg_api_name
    acm_certificate_arn = module.acm_certificate.certificate_arn
}

module "S3_Cloudfront" {
    source = "./modules/s3-cloudfront"
    acm_certificate_arn = module.acm_certificate.certificate_arn
}
module "acm_certificate" {
  source                  = "./modules/acm"
  domain_name             = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  route53_zone_id         = var.route53_zone_id
}

module "cluster" {
  source                  = "./modules/cluster"
  container_name          = var.container_name
  cluster_name            = var.cluster_name
  task_family             = var.task_family
  container_image         = var.container_image
  container_cpu           = var.container_cpu
  container_memory        = var.container_memory
  container_port          = var.container_port
  task_memory             = var.task_memory
  task_cpu                = var.task_cpu
  service_name            = var.service_name
  desired_count           = var.desired_count
  subnets                 = module.Networking.private_subnet_ids
  security_groups         = var.module.Security.sg_bastion_id
}
