# variables.tf

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "finalsamples3bucketpari456" 
}

variable "acc-key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret" {
  description = "AWS Secret Key"
  type        = string
}
