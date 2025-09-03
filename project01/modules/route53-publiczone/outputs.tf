# Output the Route 53 private hosted zone ID
output "route53_public_zone_id" {
  value = aws_route53_zone.public.id
  description = "The ID of the Route 53 public hosted zone"
}

# Output the Private zone name servers
output "route53_public_zone_name_servers" {
  value = aws_route53_zone.public.name_servers
  description = "The name servers of the Route 53 public hosted zone"
}