# Output AWS KMS Key ID
output "kms_key_id" {
  value       = aws_kms_key.mykey.key_id
  description = "The ID of the KMS key"
}

# Output AWS KMS Key ARN
output "kms_key_arn" {
  value       = aws_kms_key.mykey.arn
  description = "The ARN of the KMS key"
}