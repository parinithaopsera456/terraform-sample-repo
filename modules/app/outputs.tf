# outputs.tf

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
