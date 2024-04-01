resource "aws_vpc_endpoint" "my_endpoint" {
  vpc_id             = var.my_default_vpc
  service_name       = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.forendpoint.id]
  subnet_ids         = var.subnet_ids
  private_dns_enabled = true
}

