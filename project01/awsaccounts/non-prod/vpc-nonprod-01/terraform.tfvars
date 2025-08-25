
#Define backend variables
aws_region       = "us-east-1"
account_iam_role = "arn:aws:iam::621552110459:role/devops-terraform-role"

#Define VPC specific variables
vpc_name    = "vpc-nonprod-01"
vpc_cidr_01 = "10.0.0.0/16"
environment = "non-prod"
project     = "ecommerce"