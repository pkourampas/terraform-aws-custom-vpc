resource "aws_instance" "ec2_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.instance_az
  associate_public_ip_address = var.associate_public_ip
  subnet_id = var.instance_subnet
  tenancy = var.instance_tenancy
  vpc_security_group_ids = tolist(var.vpc_sg_group_id)

  tags = {
    Name = var.instance_name
  }

}
