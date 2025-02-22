output "region" {
  value = local.selected_region
}

output "aws_cidr" {
  value = var.aws_vpc_cidr
}

output "bastion_host_public_ip_address" {
  value = module.bastion_host.bastion_host_public_ip  
}
