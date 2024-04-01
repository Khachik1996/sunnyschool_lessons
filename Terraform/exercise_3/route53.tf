resource "aws_route53_zone" "private_zone" {
  name = "testdomain.net"
  vpc {
    vpc_id = var.my_default_vpc
  }
}

resource "aws_route53_record" "alb_cname" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "web.testdomain.net"
  type    = "CNAME"
  ttl     = 60
  records = [aws_lb.internal_alb.dns_name]
}

