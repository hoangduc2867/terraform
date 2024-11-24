variable "project" {
    type = string
}
variable "engine" {
    type = string
}
variable "engine_version" {
    type = string
}
variable "rds_instance_class" {
    type = string
}
variable "sg_db_id" {
    type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "parameter_group_name" {
    type = string
}

variable "db_name" {
    type = string
}
variable "username" {
    type = string
}
variable "password" {
    type = string
}