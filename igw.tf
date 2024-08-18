# Create an internet gateway
resource "aws_internet_gateway" "terraform_vpc_igw" {
  vpc_id = aws_vpc.terraform_vpc.id
}
