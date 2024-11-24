output "sg_bastion_id" {
    value = aws_security_group.sg_bastion.id
}
output "sg_runner_id" {
    value = aws_security_group.sg_runner.id
}
output "sg_api_id" {
  value = aws_security_group.sg_api.id
}
output "sg_alb_id" {
  value = aws_security_group.alb_sg.id
}
output "sg_monitor_id" {
  value = aws_security_group.sg_monitor.id
}
output "sg_db_id" {
  value = aws_security_group.sg_db.id
}