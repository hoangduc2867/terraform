variable "vpc_id" {
    type = string
}
variable "sg_alb_id" {
    type = string
}
variable "public_subnet_ids" {
    type = list(string)
}
variable "asg_api_name" {
    type = string
}
variable "acm_certificate_arn" {
  type = string
}
