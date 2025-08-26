#Create VPC using the local VPC module
module "vpc" {
  source = "../../../modules/vpc"

  vpc_name    = var.vpc_name
  vpc_cidr_01 = var.vpc_cidr_01
  aws_region  = var.aws_region
  environment = var.environment
  project     = var.project

}
#Create Security Group using the local VPC Security Group module
module "vpc_sg" {
  source = "../../../modules/vpcsg"

  vpc_id            = module.vpc.vpc_id
  cidr_ipv4_entry_1 = var.cidr_ipv4_entry_1
  cidr_ipv4_entry_2 = var.cidr_ipv4_entry_2

}

#Create Prefix List using the Prefix List module
module "prefix_list" {
  source = "../../../modules/prefixlist"

  prefix_list_name   = var.prefix_list_name
  max_entries        = var.max_entries
  cidr_block_entry_1 = var.cidr_block_entry_1
  cidr_block_entry_2 = var.cidr_block_entry_2
}

#Create Network ACL using the local VPC Network ACL module
module "vpc_ncl" {
  source = "../../../modules/vpcncl"

  vpc_id   = module.vpc.vpc_id
  vpc_name = var.vpc_name

}