# main.tf

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"  # Set the bucket ACL to private
}

resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning {
    enabled = true  # Enable versioning for the bucket
  }
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::YOUR_ACCOUNT_ID:role/YOUR_ROLE_NAME"  # Specify your IAM user or role ARN
        }
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = [
          aws_s3_bucket.my_bucket.arn,
          "${aws_s3_bucket.my_bucket.arn}/*"
        ]
      }
    ]
  })
}
