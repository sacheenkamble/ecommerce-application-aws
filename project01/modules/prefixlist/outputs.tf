#Define outputs for the prefix list
output "prefix_list_id" {
  description = "The ID of the prefix list"
  value       = aws_ec2_managed_prefix_list.example.id
}
output "prefix_list_arn" {
  description = "The ARN of the prefix list"
  value       = aws_ec2_managed_prefix_list.example.arn
}
output "prefix_list_name" {
  description = "The name of the prefix list"
  value       = aws_ec2_managed_prefix_list.example.name
}