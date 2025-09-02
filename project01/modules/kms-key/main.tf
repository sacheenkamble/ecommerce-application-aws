# Create a KMS key for encrypting S3 bucket objects
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  enable_key_rotation     = true
  deletion_window_in_days = 7 # KMS key deletion window
}