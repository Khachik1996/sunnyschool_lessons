resource "aws_security_group" "foralb" {
  name        = "foralb"
  description = "Security group for ALB to allow HTTP traffic"
  vpc_id      = var.my_default_vpc

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "forendpoint" {
  name        = "forendpoint"
  description = "Security group for endpoint with ingress only from ALB SG"
  vpc_id      = var.my_default_vpc

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.foralb.id]
  }
}

