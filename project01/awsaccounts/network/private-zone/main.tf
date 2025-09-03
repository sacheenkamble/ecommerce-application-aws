# Define a route 53 private hosted zone module
module "route53_private_zone" {
  source = "../../../modules/route53-privatezone"
   
  private_zone_name = var.private_zone_name
  vpc_id = data.terraform_remote_state.vpc_network.outputs.vpc_id
  tags = {
    Environment = "Shared-Network"
    Project     = "Ecommerce Application"
    Owner       = "DevOps Team"
  }
}