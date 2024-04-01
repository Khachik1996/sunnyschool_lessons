resource "aws_lb_target_group" "example" {
  name     = "example-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.my_default_vpc
  target_type = "ip"

  health_check {
    enabled     = true
    path        = "/"
    protocol    = "HTTP"
    matcher     = "200,307,405"
    interval    = 30
    timeout     = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}

