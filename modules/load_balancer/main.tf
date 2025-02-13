provider "aws" {
  region = "ap-south-1"
}

resource "aws_lb" "lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
}

resource "aws_lb_target_group" "blue" {
  name        = "${var.lb_name}-blue"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group" "green" {
  name        = "${var.lb_name}-green"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue.arn
  }
}

output "lb_arn" {
  value = aws_lb.lb.arn
}

output "blue_tg_arn" {
  value = aws_lb_target_group.blue.arn
}

output "green_tg_arn" {
  value = aws_lb_target_group.green.arn
}

output "listener_arn" {
  value = aws_lb_listener.listener.arn
}
