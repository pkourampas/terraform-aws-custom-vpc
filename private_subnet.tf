# Create a Private Subnet in 1st availability zone
resource "aws_subnet" "private" {
  count = var.number_of_private_subnets

  vpc_id = aws_vpc.my_vpc.id
  cidr_block = cidrsubnet(aws_vpc.my_vpc.cidr_block, 8, count.index + 1 + local.azs_number)
  availability_zone = data.aws_availability_zones.available.names[count.index] 
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet_${count.index + 1}"
  }
}
