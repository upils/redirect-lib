resource "random_string" "origin_id" {
  length  = 16
  special = false
}


resource "aws_cloudfront_distribution" "redirector_distribution" {
  origin {
    domain_name = var.c2_domain
    origin_id   = random_string.origin_id.result
    custom_origin_config {
      http_port              = var.c2_port_http
      https_port             = var.c2_port_https
      origin_protocol_policy = "match-viewer" # Only talk to the origin over HTTPS
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  enabled         = true
  is_ipv6_enabled = true
  comment         = var.redirector_name

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = random_string.origin_id.result

    forwarded_values {
      query_string = false

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
