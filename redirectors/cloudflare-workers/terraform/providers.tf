locals {
  CLOUDFLARE_API_KEY = lookup(var.credentials, "CLOUDFLARE_API_KEY", "INVALID")
  CLOUDFLARE_EMAIL   = lookup(var.credentials, "CLOUDFLARE_EMAIL", "INVALID")
  CLOUDFLARE_ZONE_ID   = lookup(var.credentials, "CLOUDFLARE_ZONE_ID", "INVALID")
}

provider "cloudflare" {
  version = "~> 2.0"
  email   = local.CLOUDFLARE_EMAIL
  api_key = local.CLOUDFLARE_API_KEY
}
