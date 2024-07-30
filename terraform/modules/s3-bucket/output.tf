output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.bucket_domain_name
}