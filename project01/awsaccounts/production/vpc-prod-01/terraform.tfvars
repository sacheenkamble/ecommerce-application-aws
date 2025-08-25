
#Define backend variables
aws_region       = "us-east-1"
account_iam_role = "arn:aws:iam::772192286060:role/devops-terraform-role"

#Define VPC specific variables
vpc_name    = "vpc-prod-01"
vpc_cidr_01 = "10.10.0.0/16"
environment = "production"
project     = "ecommerce-prod"