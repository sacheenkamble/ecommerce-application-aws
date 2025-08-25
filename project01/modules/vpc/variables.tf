#Define VPC name
variable "vpc_name" {
    type = string
    description = "Name of VPC resource"
}

#Define AWS region
variable "aws_region" {
    type = string
    description = "AWS region ID"
}


#Define VPC CIDR block
variable "vpc_cidr_01" {
    type = string
    description = "1st CIDR block for VPC"
}

#Define Environment tag
variable "environment" {
    type = string
    description = "Environment tag for resources"
}

#Define Project tag
variable "project" {
    type = string
    description = "Project tag for resources"
}
