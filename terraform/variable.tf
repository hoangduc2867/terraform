variable "region" {
    type = string 
}
#########################################
# Tags
#########################################
variable "environment" {
    type = string 
}
variable "project" {
    type = string 
}
#########################################
# VPC
#########################################
variable "vpc_cidr" {
    type = string 
}
variable "vpc_name" {
    type = string 
}
variable "igw_name" {
    type = string 
}
variable "public_subnet_name" {
    type = string 
}
variable "private_subnet_name" {
    type = string 
}
variable "availability_zones" {
    type = list(string) 
}


# Key Pair
variable "keypair_path" {
    type = string 
}

# Databass
variable "engine" {
    type = string 
}
variable "engine_version" {
    type = string 
}
variable "rds_instance_class" {
    type = string 
}
variable "parameter_group_name" {
    type = string
}

# Compute
variable "bastion_instance_name" {
    type = string
}
variable "runner_instance_name" {
    type = string
}
variable "api_instance_name" {
    type = string
}
variable "bastion_ami_id" {
    type = string 
}
variable "bastion_instance_type" {
    type = string 
}
variable "runner_ami_id" {
    type = string 
}
variable "runner_instance_type" {
    type = string 
}
variable "api_ami_id" {
    type = string 
}
variable "api_instance_type" {
    type = string 
}
variable "monitor_instance_name" {
    type = string 
}
variable "monitor_ami_id" {
    type = string 
}
variable "monitor_instance_type" {
    type = string 
}
# S3 and Cloundfront
variable "acm_certificate_arn" {
  type = string
}

# ACM
variable "domain_name" {
  description = "Tên miền chính để tạo chứng chỉ ACM"
  type        = string
}

variable "subject_alternative_names" {
  description = "Danh sách các SANs cho chứng chỉ ACM"
  type        = list(string)
  default     = []
}

variable "route53_zone_id" {
  description = "ID của Hosted Zone trong Route53"
  type        = string
}
### ecs
variable "container_name" {
  description = "Tên container"
  type        = string
}

variable "cluster_name" {
  description = "Tên ECS Cluster"
  type        = string
}
variable "task_family" {
  description = "Tên Task Family ECS"
  type        = string
}

variable "container_image" {
  description = "Hình ảnh Docker container"
  type        = string
}

variable "container_cpu" {
  description = "CPU được phân bổ cho container"
  type        = number
}

variable "container_memory" {
  description = "Bộ nhớ được phân bổ cho container (MB)"
  type        = number
}

variable "container_port" {
  description = "Cổng của container"
  type        = number
}

variable "task_memory" {
  description = "Bộ nhớ của ECS Task (MB)"
  type        = string
}

variable "task_cpu" {
  description = "CPU của ECS Task"
  type        = string
}

variable "service_name" {
  description = "Tên ECS Service"
  type        = string
}

variable "desired_count" {
  description = "Số lượng task mong muốn"
  type        = number
}

variable "db_name" {
  description = "tên database"
  type        = string
}

variable "username" {
  description = "user login database"
  type        = string
}
variable "password" {
  description = "pass login database"
  type        = string
}