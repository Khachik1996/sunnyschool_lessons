variable "region" {
  description = "AWS region for the resources"
  default     = "us-east-2"
}

variable "my_default_vpc" {
  description = "Default VPC ID"
  default     = "vpc-063047ce1603c53f5"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the resources"
  type        = list(string)
  default     = ["subnet-036b2dc2750d40d68", "subnet-07494b85db4f340ce", "subnet-0a3ec96594b86a348"]
}

variable "domain_name" {
  description = "The domain name for the Route 53 zone"
  default     = "testdomain.net"
}

