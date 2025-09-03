# Get VPC ID of Network Account VPC
data "terraform_remote_state" "vpc_network" {
  backend = "s3"
  config = {
    bucket = "project01-infra-terraform-state-bucket"
    key    = "network/vpc/vpc-network-01.tfstate" # Path to the VPC state file
    region = "us-east-1"
  }
}

