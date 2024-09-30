# provider.tf

provider "aws" {
  region     = "us-east-1"
  access_key = var.acc-key
  secret_key = var.secret
}
