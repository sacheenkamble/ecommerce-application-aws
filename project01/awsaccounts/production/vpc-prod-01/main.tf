
module "vpc" {
  source = "../../../modules/vpc"

  vpc_name    = var.vpc_name
  vpc_cidr_01 = var.vpc_cidr_01
  aws_region  = var.aws_region
  environment = var.environment
  project     = var.project

}

