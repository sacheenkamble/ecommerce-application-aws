# Define a security group that allows inbound TLS traffic (port 443) from within the a CIDR block
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_tls"
  }

# Ensure the security group is created to avoid dependency errors
lifecycle {
    create_before_destroy = true
  }

# Set a timeout for deletion to handle potential delays
timeouts {
    delete = "2m"
  }

}

#Define ingress rules for the security group
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4-1" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_ipv4_entry_1
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

#Define ingress rules for the security group
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4-2" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_ipv4_entry_2
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


#Define egress rules for the security group
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}