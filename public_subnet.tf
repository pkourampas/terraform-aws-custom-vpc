# Allow access to the list of AWS Availability Zones
# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

# ----- Create subnets -----
resource "aws_subnet" "public" {
  count = length(data.aws_availability_zones.available.names)                 # Provides a list of availability zone names

  vpc_id = aws_vpc.my_vpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = cidrsubnet(aws_vpc.my_vpc.cidr_block, 8, count.index+1)
  map_public_ip_on_launch = true                                              # Instances launches into the subnet should be assigned a public IP address

  tags = {
    Name = "public_subnet_${count.index + 1}"
  }
}

# ----- Route Table -----
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

# ----- Associate Public Subnet with Route Table -----
resource "aws_route_table_association" "public_route_table_associate" {
  count = length(data.aws_availability_zones.available.names)

  subnet_id = element(aws_subnet.public.*.id, count.index)            # Retrieves a single element from a list
  route_table_id = aws_route_table.public.id
}

# ----- Create an Elastic IP for the NAT Gateway -----
# resource "aws_eip" "nat_gateway_eip" {
#   domain = "vpc"
# }
