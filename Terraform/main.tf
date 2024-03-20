data "aws_ssm_parameter" "my_amzn_linux_ami" {
  name  = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}



resource "aws_instance" "web" {
  ami           = "ami-0f403e3180720dd7e"
  instance_type = "t2.micro"
  count         = 2

  tags = {
    Name = "HelloWorld-${substr(uuid(), 0, 7)}"
  }
}

