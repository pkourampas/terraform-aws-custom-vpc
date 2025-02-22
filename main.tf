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

/* We will create an s3 bucket to store our terraform state file */
module "s3_backend" {
  source = "./modules/s3_bucket"
  name = var.s3-bucket-name
  s3-bucket-region = local.selected_region
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

/* 
We are using the aws_ami data source to filter the latest amazon linux machine Image
for our Bastion host 
*/

# ----- AWS AMI FILTER -----
data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  owners = ["amazon"]
}


# ----- Bastion Host Public Subnet -----
module "bastion_host" {
  source = "./modules/ec2_instance"
  ami_id = data.aws_ami.latest_amazon_linux.id
  instance_az = data.aws_availability_zones.available.names[0]
  instance_name = "Bastion Host"
  instance_type = "t2.small"
  associate_public_ip = true
  instance_subnet = aws_subnet.public[0].id      # The bastion host will be deployed on the first public subnet
  instance_tenancy = "default"
  
}
