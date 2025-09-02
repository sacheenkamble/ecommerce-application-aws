
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

#Define S3 bucket name variable
variable "bucket_names" {
  description = "The name of the S3 bucket"
  type        = list(string)
  default     = ["my-nonprod-ecommerce-bucket-1", "my-nonprod-ecommerce-bucket-2"]
}

#Define tags variable
variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default = {
    Environment = "non-prod"
    Project     = "ecommerce"
  }
}