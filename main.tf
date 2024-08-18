# ----- Provider -----
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ----- AWS Region -----
provider "aws" {
    region = local.selected_region
}

# Create VPC with IPv4 CIDR block of 254 IPs (var.aws_vpc_cidr)
resource "aws_vpc" "my_vpc" {
  cidr_block = var.aws_vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "my_vpc"
  }
}

# ----- AWS Internet Gateway -----
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "main-igw"
  }
}
