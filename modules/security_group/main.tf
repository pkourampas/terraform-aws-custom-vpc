resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.sg_vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_incoming_traffic" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule }

  security_group_id = aws_security_group.sg.id

  cidr_ipv4         = each.value.cidr_block
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  ip_protocol       = each.value.ip_protocol
}

resource "aws_vpc_security_group_egress_rule" "allow_outgoing_traffic" {
  for_each = { for idx, rule in var.egress_rules : idx => rule }

  security_group_id = aws_security_group.sg.id

  cidr_ipv4   = each.value.cidr_block
  from_port   = each.value.from_port
  ip_protocol = each.value.ip_protocol
  to_port     = each.value.to_port
}
