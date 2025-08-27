# Output the VPC ID
output "vpc_id" {
  value = module.vpc.vpc_id
}
# Output the public subnet IDs
output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}
# Output the private subnet IDs
output "private_subnet_az1_ids" {
  value = module.vpc.private_subnet_az1_ids
}
output "private_subnet_az2_ids" {
  value = module.vpc.private_subnet_az2_ids
}

# Output the Internet Gateway ID
output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

# Output security group ID
output "security_group_id" {
  value = module.vpc_sg.security_group_id
}

# Output the prefix list name
output "prefix_list_name" {
  value = module.prefix_list.prefix_list_name
}
