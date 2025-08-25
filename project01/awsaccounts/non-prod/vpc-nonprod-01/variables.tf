

///Define variables for AWS provider and backend configuration ////

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

///Define variables for VPC module ////

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