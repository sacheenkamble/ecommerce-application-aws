# Get the VPC ID from data source and output
output "vpc_id" {
  description = "The ID of the VPC associated with the private hosted zone"
  value       = data.terraform_remote_state.vpc_network.outputs.vpc_id
}

# Output the Route 53 private hosted zone ID
output "route53_private_zone_id" {
  value       = module.route53_private_zone.route53_private_zone_id
  description = "The ID of the Route 53 private hosted zone"
}

# Output the Private zone name servers
output "route53_private_zone_name_servers" {
  value       = module.route53_private_zone.route53_private_zone_name_servers
  description = "The name servers of the Route 53 private hosted zone"
}

