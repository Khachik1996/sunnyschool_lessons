resource "aws_lb" "internal_alb" {
  name               = "my-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.foralb.id]
  subnets            = var.subnet_ids
  enable_deletion_protection = false
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.internal_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "This is the default response for unmatched routes."
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener_rule" "redirect_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 100

  action {
    type = "redirect"
    redirect {
      protocol = "HTTP"
      port     = "80"
      path     = "/#{path}index.html"
      query    = "#{query}"
      host     = "#{host}"
      status_code = "HTTP_301"
    }
  }

  condition {
    host_header {
      values = [var.domain_name]
    }
  }

  condition {
    path_pattern {
      values = ["*/"]
    }
  }
}

resource "aws_lb_listener_rule" "forward_to_vpc_endpoints" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.example.arn
  }

  condition {
    host_header {
      values = [var.domain_name]
    }
  }
}

