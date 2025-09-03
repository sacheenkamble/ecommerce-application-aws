# Define a private Route 53 hosted zone
resource "aws_route53_zone" "private" {
  name = var.private_zone_name
  comment = "Private hosted zone for application"
  vpc {
    vpc_id = var.vpc_id
  }

  tags = var.tags
}

