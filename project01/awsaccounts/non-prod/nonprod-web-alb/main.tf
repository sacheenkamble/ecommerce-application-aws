# Create ALB in the public subnets of the VPC using ALB module
module "alb" {
  source = "../../../modules/alb"
    alb_name               = var.alb_name
    alb_internal           = var.alb_internal
    alb_subnet_ids         = data.aws_subnets.publicsubnets.ids
    alb_access_log_bucket  = data.aws_s3_bucket.alb_bucket.bucket
    alb_access_log_prefix  = "/alb-logs"
    vpc_id                 = data.aws_vpc.nonprodvpc.id
    asg_name               = var.asg_name



    tags = {
      Environment = "Non-Prod"
      Project     = "Ecommerce"
      Owner       = "DevOps"
    }
}