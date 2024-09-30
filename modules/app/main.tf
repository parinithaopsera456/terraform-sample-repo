# main.tf

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  # Set versioning to enabled
  versioning_configuration {
    status = "Enabled"  # Correct usage
  }
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
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
