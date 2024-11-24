variable "domain_name" {
  description = "Tên miền chính để tạo chứng chỉ"
  type        = string
}

variable "subject_alternative_names" {
  description = "Các tên miền phụ (SANs) cho chứng chỉ"
  type        = list(string)
  default     = []
}

variable "route53_zone_id" {
  description = "ID của Hosted Zone trong Route53"
  type        = string
}
