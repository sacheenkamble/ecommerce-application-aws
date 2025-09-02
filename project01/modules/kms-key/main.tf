# Create a KMS key for encrypting S3 bucket objects
resource "aws_kms_key" "mykey" {
  description            = "KMS key for encrypting"
  enable_key_rotation     = true
  deletion_window_in_days = 30 # KMS key deletion window in days
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::*:root"
        }
        Action = "kms:*"
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = var.kms_key_name
  }

}