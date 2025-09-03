# Define a private Route 53 hosted zone
resource "aws_route53_zone" "private" {
  name = "blissandbake.internal"
  comment = "Private hosted zone for Bliss and Bake application"
  vpc {
    vpc_id = var.vpc_id
  }

  tags = var.tags
}

