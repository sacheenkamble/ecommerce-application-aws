##Define terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }

  ## Define S3 bucket as terraform backend
  ///Use terraform init -backend-config="key=<s3-key-path>" to set the key path dynamically///
  backend "s3" {
    bucket       = "project01-infra-terraform-state-bucket"
    region       = "us-east-1"
    use_lockfile = true #Enable S3 native state locking
    encrypt      = true #Enable encryption to protect the state file at rest
  }
}


#Define AWS Provider configurations
provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = var.account_iam_role
  }
}
