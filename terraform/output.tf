output "bastion_instance_public_ip" {
    value = module.Compute.bastion_instance_public_ip
}
output "asg_api_name" {
  value = module.Compute.asg_api_name
}
output "runner_instance_public_ip" {
    value = module.Compute.runner_instance_public_ip
}
output "cloudfront_domain_name" {
    value = module.S3_Cloudfront.cloudfront_domain_name
}
output "alb_dns" {
    value = module.Load_Balancing.alb_dns
}
output "ecs_cluster_id" {
  description = "ID của ECS Cluster"
  value       = module.ecs.ecs_cluster_id
}

output "ecs_service_arn" {
  description = "ARN của ECS Service"
  value       = module.ecs.ecs_service_arn
}
