resource "aws_instance" "bastion_host" {
  ami = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.instance_az
  associate_public_ip_address = var.associate_public_ip
  subnet_id = var.instance_subnet
  tenancy = var.instance_tenancy

  tags = {
    Name = var.instance_name
  }

}
