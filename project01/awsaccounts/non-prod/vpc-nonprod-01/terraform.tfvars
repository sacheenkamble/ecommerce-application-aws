
#Define backend variables
aws_region       = "us-east-1"
account_iam_role = "arn:aws:iam::621552110459:role/devops-terraform-role"

#Define VPC specific variables
vpc_name    = "vpc-nonprod-01"
vpc_cidr_01 = "10.0.0.0/16"
environment = "non-prod"
project     = "ecommerce"

#Define CIDR blocks for TLS security group module
cidr_ipv4_entry_1 = "10.0.0.0/8"
cidr_ipv4_entry_2 = "172.16.0.0/12"

#Define Custom Prefix List specific variables
prefix_list_name   = "RFC1918-prefix-list"
cidr_block_entry_1 = "10.0.0.0/8"
cidr_block_entry_2 = "172.16.0.0/12"
max_entries        = 5

#Define Network ACL specific variables
#(No additional variables needed for this module)