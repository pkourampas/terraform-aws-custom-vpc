# Create an Elastic IP Adddress and Assign it on NAT (Network Address Translate) in order for resources which are provisioned on private subnet to
# gain internet access
resource "aws_eip" "terraform_aws_public_subnet_nat_ip" {
}

resource "aws_nat_gateway" "terraform_aws_nat_gateway" {
    allocation_id = aws_eip.terraform_aws_public_subnet_nat_ip.id
    subnet_id = aws_subnet.terraform_vpc_public_subnet.id

    tags = {
      Name = "NAT Gateway"
    }

    depends_on = [ aws_eip.terraform_aws_public_subnet_nat_ip ]
}
