variable "cloudflare_api_token" {
  description = "Cloudflare API token with Zone.Cache Purge permissions"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for the website"
  type        = string
}
