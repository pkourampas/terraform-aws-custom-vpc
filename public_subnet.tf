# Retrieves the list of availability zones in the Current Region
data "aws_availability_zones" "available" {
    state = "available"
}

# Create two public subnet (one on each availability zone)
resource "aws_subnet" "terraform_vpc_public_subnet" {
    count = 2

    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = cidrsubnet(var.aws_vpc_cidr, 3, count.index)       # It will create subnet with 30 IPs Available
    availability_zone = data.aws_availability_zones.available.names[count.index] % length(data.aws_availability_zones.available.names)
    map_public_ip_on_launch = true
}

# Associate the public subnet with Internet Gateway route
resource "aws_route_table_association" "terraform_vpc_public_subent_associate_public_rt" {
    count = 2

    subnet_id = aws_subnet.terraform_vpc_public_subnet[count.index].id
    route_table_id = aws_route_table.terraform_vpc_public_route_table.id
}
