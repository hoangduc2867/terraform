#########################################
# ALB
#########################################
resource "aws_lb" "api_lb" {
  name               = "private-demo-api"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_alb_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "private-demo-api"
  }
}
#########################################
# Target Group
#########################################
resource "aws_lb_target_group" "api_tg" {
  name     = "api-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/health" // edit health check path
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200"
  }
}
#########################################
# Listener at port 80
#########################################
resource "aws_lb_listener" "api_listener" {
  load_balancer_arn = aws_lb.api_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_tg.arn
  }
}
#########################################
# Listener at port https
#########################################
resource "aws_lb_listener" "api_https" {
  load_balancer_arn = aws_lb.api_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_tg.arn
  }
}
#########################################
# Attach the Auto Scaling Group to the Target Group
#########################################
resource "aws_autoscaling_attachment" "api_asg_attachment" {
  autoscaling_group_name = var.asg_api_name
  lb_target_group_arn    = aws_lb_target_group.api_tg.arn
}