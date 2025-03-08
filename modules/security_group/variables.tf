variable "security_group_name" {
  type = string
  description = "Please provide the SSH Security Group name."
}

variable "security_group_description" {
  type = string
  description = "Please provide the description of the security group rule."
}

variable "sg_vpc_id" {
  type = string
  description = "Enter the VPC ID where the security group will be created."
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port = number
    to_port = number
    ip_protocol = string
    cidr_block = string
  }))
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port = number
    to_port = number
    ip_protocol = string
    cidr_block = string
  }))
}
