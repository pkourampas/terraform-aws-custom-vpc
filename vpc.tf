# Create VPC with IPv4 CIDR block of 254 IPs (var.aws_vpc_cidr)
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.aws_vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "terraform-vpc"
  }
}
