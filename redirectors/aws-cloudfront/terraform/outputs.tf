output "redirector_url" {
  value = aws_cloudfront_distribution.redirector_distribution.domain_name
}
