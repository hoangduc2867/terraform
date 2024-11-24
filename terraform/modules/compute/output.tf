output "bastion_instance_public_ip" {
    value = aws_instance.bastion.public_ip
}
output "asg_api_name" {
  value = aws_autoscaling_group.api.name
}
output "runner_instance_public_ip" {
    value = aws_instance.runner.public_ip
}