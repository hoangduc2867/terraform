output "certificate_arn" {
  description = "ARN của chứng chỉ ACM đã tạo"
  value       = aws_acm_certificate.this.arn
}
