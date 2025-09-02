
#Get VPC ID from the non-prod VPC module
data "aws_vpc" "nonprod_vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-nonprod-01"]
  }
}

#Get Subnet IDs from the non-prod VPC module
data "aws_subnets" "publicsubnets" {
  filter {
    name   = "tag:Name"
    values = ["PublicSubnet-*"]
  }
}

#Get Security Group ID from the non-prod security group module
data "aws_security_group" "nonpprodvpc_sg" {
  filter {
    name   = "tag:Name"
    values = ["allow_tls"]
  }
}


#Create IAM Role for EC2 instance profile
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}