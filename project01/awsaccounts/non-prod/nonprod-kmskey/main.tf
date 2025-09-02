# Define KMS key module variables
module "kms_key" {
  source       = "../../../modules/kms-key"
  kms_key_name = var.kms_key_name
}