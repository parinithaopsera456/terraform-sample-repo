# provider.tf

provider "aws" {
  region = "us-east-1"

  # Optionally specify access and secret keys
   access_key = "acc-key"
   secret_key = "secret"
}
