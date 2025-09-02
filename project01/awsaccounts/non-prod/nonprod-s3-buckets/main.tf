#Create S3 buckets  using the local S3 module
module "nonprod_s3_bucket_logs" {
  source = "../../../modules/s3"

  bucket_names = var.bucket_names
  region       = var.region
  tags         = var.tags

}