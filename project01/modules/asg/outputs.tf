#Output the Auto Scaling Group name
output "autoscaling_group_name" {
  value = aws_autoscaling_group.example.name
}
#Output the Launch Template ID
output "launch_template_id" {
  value = aws_launch_template.example.id
}
#Output the Scaling Policies ARNs
output "scale_up_policy_arn" {
  value = aws_autoscaling_policy.scale_up.arn
}
output "scale_down_policy_arn" {
  value = aws_autoscaling_policy.scale_down.arn
}
