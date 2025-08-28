#Define Amazon S3 resource
resource "aws_s3_bucket" "example" {

  for_each = toset(var.bucket_names)
  
  bucket = each.key    #example-bucket-12345
  region = var.aws_region
  tags = var.tags


lifecycle {
    prevent_destroy = true
  }

}
