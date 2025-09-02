///Define variables for AWS provider and S3 backend configuration ////////////////
//////////////////////////////////////////////////////////////////////////////////
#Define AWS region variable
variable "region" {
  description = "The AWS region where the S3 bucket will be created"
  type        = string
  default     = "us-east-1"

  validation {
    condition     = contains(["us-east-1", "us-west-1", "us-west-2"], var.region)
    error_message = "Invalid AWS region. Allowed values are us-east-1, us-west-1, us-west-2 only"
  }

}

#Define Account specific roles to assume for Terraform
variable "account_iam_role" {
  type    = string
  default = "arn:aws:iam::621552110459:role/devops-terraform-role" ## Non-Production Account IAM role.
}


# Define variables for the KMS key module
variable "kms_key_name" {
  description = "The name of the KMS key"
  type        = string
  default     = "nonprod-kms-key01"
}