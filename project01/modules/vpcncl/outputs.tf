
#Define outputs for the VPC Network ACL
output "network_acl_id" {
  description = "The ID of the Network ACL"
  value       = aws_network_acl.main.id
}
output "network_acl_arn" {
  description = "The ARN of the Network ACL"
  value       = aws_network_acl.main.arn
}