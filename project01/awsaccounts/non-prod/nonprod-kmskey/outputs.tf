# Output AWS KMS Key ID
output "kms_key_id" {
  value       = module.kms_key.kms_key_id
  description = "The ID of the AWS-KMS key"
}

# Output AWS KMS Key ARN
output "kms_key_arn" {
  value       = module.kms_key.kms_key_arn
  description = "The ARN of the AWS-KMS key"
}