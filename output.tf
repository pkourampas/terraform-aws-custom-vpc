output "region" {
  value = local.selected_region
}

output "aws_cidr" {
  value = var.aws_vpc_cidr
}
