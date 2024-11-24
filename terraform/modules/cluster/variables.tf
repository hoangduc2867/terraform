variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "task_family" {
  description = "The family name for the ECS Task Definition"
  type        = string
}

variable "container_name" {
  description = "The name of the container inside the ECS task"
  type        = string
}

variable "container_image" {
  description = "The Docker image to use for the container"
  type        = string
}

variable "container_cpu" {
  description = "The number of CPU units for the container"
  type        = number
}

variable "container_memory" {
  description = "The amount of memory for the container"
  type        = number
}

variable "container_port" {
  description = "The port the container exposes"
  type        = number
}

variable "task_memory" {
  description = "The amount of memory for the task"
  type        = string
}

variable "task_cpu" {
  description = "The amount of CPU for the task"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "desired_count" {
  description = "The desired number of tasks"
  type        = number
}

variable "subnets" {
  description = "The subnets in which to launch the ECS tasks"
  type        = list(string)
}

variable "security_groups" {
  description = "The security groups for the ECS tasks"
  type        = list(string)
}
