/* # Output S3 bucket name
   output "bucket_names_list" {
   value = module.nonprod_s3_bucket_logs[*].bucket_name
} */
