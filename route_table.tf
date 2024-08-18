# Create a Public Route table associated with Internet Gateway
resource "aws_route_table" "terraform_vpc_public_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
  }
}
