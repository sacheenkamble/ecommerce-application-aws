
# Use Generate block to generate Terraform and AWS Provider versions
generate "version" {
  path = "version.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF

##Add Terrarorm version and required provider name and version
terraform {
  required_version = ">= 1.12.2, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
}

}

## Add Provider specific configuration
provider "aws" {
 region = "us-east-1"
 assume_role {
 role_arn = "arn:aws:iam::621552110459:role/devops-terraform-role"
    }
}
EOF
}

#Use Generate block to generate S3 Backend using Terragrunt
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "project01-infra-terraform-state-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}
EOF
}
