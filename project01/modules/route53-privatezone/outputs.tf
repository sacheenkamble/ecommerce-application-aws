# Output the Route 53 private hosted zone ID
output "route53_private_zone_id" {
  value = aws_route53_zone.private.id
  description = "The ID of the Route 53 private hosted zone"
}

# Output the Private zone name servers
output "route53_private_zone_name_servers" {
  value = aws_route53_zone.private.name_servers
  description = "The name servers of the Route 53 private hosted zone"
}