# Tags
variable "environment" {
  type = string
}
variable "project" {
  type = string
}

# Subnet and Security Group
variable "public_subnet_ids" {
    type = list(string)
}
variable "private_subnet_ids" {
    type = list(string)
}

variable "sg_bastion_id" {
    type = string
}
variable "sg_runner_id" {
    type = string
}
variable "sg_api_id" {
    type = string
}
variable "sg_monitor_id" {
    type = string
}
# Key Pair
variable "key_name" {
    type = string
}

# Bastion
variable "bastion_instance_name" {
  type = string
}
variable "bastion_ami_id" {
    type = string 
}
variable "bastion_instance_type" {
    type = string
}

# Runner
variable "runner_instance_name" {
  
}
variable "runner_ami_id" {
    type = string
}
variable "runner_instance_type" {
    type = string
}

# API
variable "api_instance_name" {
  type = string
}
variable "api_ami_id" {
    type = string
}
variable "api_instance_type" {
    type = string
}

# Monitoring
variable "monitor_instance_name" {
  type = string
}
variable "monitor_ami_id" {
    type = string
}
variable "monitor_instance_type" {
    type = string
}
