##Define terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }
}

##Define AWS provider configurations
provider "aws" {
  # Configuration options
}


##Define terraform backend for this resource

