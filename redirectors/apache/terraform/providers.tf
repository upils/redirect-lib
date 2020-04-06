locals {
  AWS_ACCESS_KEY_ID     = lookup(var.credentials, "AWS_ACCESS_KEY_ID", "INVALID")
  AWS_SECRET_ACCESS_KEY = lookup(var.credentials, "AWS_SECRET_ACCESS_KEY", "INVALID")
  AWS_DEFAULT_REGION    = lookup(var.credentials, "AWS_DEFAULT_REGION", "eu-central-1")
}

provider "aws" {
  region                      = local.AWS_DEFAULT_REGION
  secret_key                  = local.AWS_SECRET_ACCESS_KEY
  access_key                  = local.AWS_ACCESS_KEY_ID
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

provider "local" {}
provider "tls" {}
