
resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0f403e3180720dd7e" # Amazon Linux 2 AMI, replace with your desired AMI
  instance_type = "t2.micro"

  tags = {
    Name = "My_TestEc2"
  }
}

