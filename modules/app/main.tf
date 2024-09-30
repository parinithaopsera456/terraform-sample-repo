# main.tf

variable "acc-key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret" {
  description = "AWS Secret Key"
  type        = string
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

# Optionally, you can add tags or versioning
resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    enabled = true
  }
}
