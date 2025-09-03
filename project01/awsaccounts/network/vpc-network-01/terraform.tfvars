
#Define backend variables
aws_region       = "us-east-1"
account_iam_role = "arn:aws:iam::376129854328:role/devops-terraform-role" ## Nework Account IAM role.

#Define VPC specific variables
vpc_name    = "vpc-network-01"
vpc_cidr_01 = "10.20.0.0/16"
environment = "sharedNetwork"
project     = "ecommerce"



##///Define Project specific common set of variables for all environments//////

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