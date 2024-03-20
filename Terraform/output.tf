output "instance_ip_addr_1" {
  value = aws_instance.web[0].public_ip
}

output "instance_ip_addr_2" {
  value = aws_instance.web[1].public_ip
}

