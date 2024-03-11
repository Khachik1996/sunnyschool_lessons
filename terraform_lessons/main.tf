resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0f403e3180720dd7e" # Replace with your desired AMI
  instance_type = "t2.micro"
  count         = 3

  tags = {
    Name = "MyEc2-${count.index + 1}"
  }
}

