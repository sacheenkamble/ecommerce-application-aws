# Define a Public Route 53 hosted zone
resource "aws_route53_zone" "public" {
  name = var.public_zone_name
  comment = "Public hosted zone for application"
  vpc {
    vpc_id = var.vpc_id
  }

  tags = var.tags
}