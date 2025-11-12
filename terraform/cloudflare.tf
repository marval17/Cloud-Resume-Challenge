resource "cloudflare_record" "root" {
  zone_id = var.cloudflare_zone_id
  name    = "@"
  type    = "CNAME"
  content = aws_cloudfront_distribution.site_cdn.domain_name
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  type    = "CNAME"
  content = aws_cloudfront_distribution.site_cdn.domain_name
  ttl     = 1
  proxied = true
}

# Optional redirect rule via Cloudflare
resource "cloudflare_page_rule" "www_redirect" {
  zone_id  = var.cloudflare_zone_id
  target   = "www.${var.domain_name}/*"
actions {
  forwarding_url {
    url         = "https://${var.domain_name}"
    status_code = 301
  }
}
}
