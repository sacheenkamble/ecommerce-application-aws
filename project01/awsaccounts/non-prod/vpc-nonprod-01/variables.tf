
//////////////////////////////////////////////////////////////////////////////
///Define variables for AWS provider and S3 backend configuration ////////////////

#Define AWS region
variable "aws_region" {
  type        = string
  description = "AWS region ID"
}

#Define Account specific roles to assume for Terraform
variable "account_iam_role" {
  type = string
}

//////////////////////////////////////////////////////////////////////////////
///Define variables for VPC module //////////////////////////////////////////

#Define VPC name
variable "vpc_name" {
  type        = string
  description = "Name of VPC resource"
}

#Define VPC CIDR block
variable "vpc_cidr_01" {
  type        = string
  description = "Primary CIDR block for VPC"
}

#Define Environment tag
variable "environment" {
  type        = string
  description = "Environment tag for resources"
}

#Define Project tag
variable "project" {
  type        = string
  description = "Project tag for resources"
}
//////////////////////////////////////////////////////////////////////////////
#/Define variables for VPC Security Group module /////////////////////////////

#Define CIDR block for security group module
variable "cidr_ipv4_entry_1" {
  description = "The IPv4 CIDR block to allow inbound TLS traffic from"
  type        = string
}

#Define CIDR block variable
variable "cidr_ipv4_entry_2" {
  description = "The IPv4 CIDR block to allow inbound TLS traffic from"
  type        = string
}

///////////////////////////////////////////////////////////////////////////////
//Define variables for Custom Prefix List module /////////////////////////////

#Define name variable for the prefix list
variable "prefix_list_name" {
  description = "The name of the prefix list"
  type        = string
}

#Define CIDR block variable for prefix list module
variable "cidr_block_entry_1" {
  description = "The IPv4 CIDR block to include in the prefix list"
  type        = string
}

#Define second CIDR block variable for prefix list module
variable "cidr_block_entry_2" {
  description = "The second IPv4 CIDR block to include in the prefix list"
  type        = string
}

#Define max entries variable for the prefix list
variable "max_entries" {
  description = "The maximum number of entries for the prefix list"
  type        = number
  default     = 5
}

#Define variables for VPC Network ACL module ////////////////////////////////
#No additional variables needed for this module