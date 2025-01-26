# ----- Create a Private Subnet in 1st availability zone -----
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

# ----- Private Subnet Route Table -----
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
}

# ----- Associate the Private Subnet with Route Table -----
resource "aws_route_table_association" "private_route_table_associate" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
