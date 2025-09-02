

# Get the VPC details from Non-Prod account
data "aws_vpc" "nonprodvpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-nonprod-01"] # Non-Prod VPC name
  }
}

# Get the public subnets details from Non-Prod account
data "aws_subnets" "publicsubnets" {
  filter {
    name   = "tag:Name"
    values = ["PublicSubnet-*"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.nonprodvpc.id]
  }
}

#Get the S3 bucket name from Non-Prod account to store ALB access logs
data "aws_s3_bucket" "alb_bucket" {
  bucket = "my-nonprod-alb-access-logs-bucket"
}
