#Define VPD ID variable
variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

#Define CIDR block variable
variable "cidr_ipv4_entry_1" {
  description = "The IPv4 CIDR block to allow inbound TLS traffic from"
  type        = string
}

#Define CIDR block variable
variable "cidr_ipv4_entry_2" {
  description = "The IPv4 CIDR block to allow inbound TLS traffic from"
  type        = string
}

