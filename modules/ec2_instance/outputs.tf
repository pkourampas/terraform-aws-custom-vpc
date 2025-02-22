output "public_ip" {
  value = aws_instance.bastion_host.public_ip
}

output "private_ip" {
  value = aws_instance.bastion_host.private_ip
}
