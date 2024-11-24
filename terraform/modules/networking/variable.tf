variable "region" {
  type        = string
  description = "Region"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "The name to be used on all the VPC resources as identifier"
}

variable "igw_name" {
  type        = string
  description = "The name to be used for the Internet Gateway"
}
#########################################
# Subnet
#########################################
variable "public_subnet_name" {
  type        = string
  description = "The name to be used for the public subnet"
}

variable "private_subnet_name" {
  type        = string
  description = "The name to be used for the private subnet"
}
#########################################
# Availability
#########################################
variable "availability_zones" {
  type        = list(string)
  description = "A list of availability zones in which to create subnets"
}