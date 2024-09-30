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

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"  # Setting the ACL here
}

resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  # Corrected versioning configuration
  versioning_configuration {
    status = "Enabled"  # Set the status here
  }
}
