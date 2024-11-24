region = "ap-northeast-1"

# Tags
environment = "develop"
project = "private-demo"

#########################################
# VPC
#########################################
vpc_cidr                = "10.0.0.0/16"
vpc_name                = "prod-private-demo-vpc"
igw_name                = "prod-private-demo-igw"
public_subnet_name      = "prod-private-demo-public-subnet"
private_subnet_name     = "prod-private-demo-private-subnet"
availability_zones      = ["ap-northeast-1a","ap-northeast-1c"]
#########################################
# Key Pair
#########################################
keypair_path            = "~/.ssh/prod_private_demo.pub"

#########################################
# Database
#########################################
engine                  = "mysql"
engine_version          = "8.0.36"
rds_instance_class      = "db.t3.medium"
parameter_group_name    = "default.mysql8.0"
#########################################
# Instance
#########################################
// Bastion
bastion_instance_name   = "prod-private-demo-bastion"
bastion_ami_id          = "ami-020283e959651b381" // Amazon linux 2023
bastion_instance_type   = "t3.micro"
// Runner
runner_instance_name    = "prod-private-demo-runner"
runner_ami_id           = "ami-020283e959651b381" // Amazon linux 2023
runner_instance_type    = "t3.small"
// API
api_instance_name       = "prod-private-demo"
api_ami_id              = "ami-053123ce6c73cd956" // AMI private-demo-be
api_instance_type       = "t3.medium"
// Monitor
monitor_instance_name   = "prod-private-demo-monitor"
monitor_ami_id          = "ami-020283e959651b381" // Amazon linux 2023
monitor_instance_type   = "t3.small"
#########################################
# ecs
#########################################
container_name          = "ecs-container-demo"
cluster_name            = "ecs-demo-cluster"
task_family             = "ecs-demo-task"
container_image         = "nginx:latest"
container_cpu           = "256"
container_memory        = "512"
container_port          = "80"
task_memory             = "512"
task_cpu                = "256"
service_name            = "ecs-demo-service"
desired_count           = "2"
domain_name             = "sample-app.example.com"
#########################################
# db
#########################################
db_name                 = "private_demo_db"
username                = "root"
password                = "wlyl^e!w7syJrmY2"