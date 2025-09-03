///Define variables for AWS provider and S3 backend configuration ////////////////
//////////////////////////////////////////////////////////////////////////////////
#Define AWS region
variable "aws_region" {
  type        = string
  description = "AWS region ID"
  default     = "us-east-1"
}

#Define Account specific roles to assume for Terraform
variable "account_iam_role" {
  type    = string
  default = "" ## Non-Production Account IAM role.
}


# # Define variables for the Route 53 private hosted zone module
# variable "vpc_id" {
#   description = "The ID of the VPC to associate with the private hosted zone"
#   type        = string
# }

# Define variable for private zone name
variable "private_zone_name" {
  description = "The name of the private hosted zone"
  type        = string
  default     = "blissandbake.internal"
}