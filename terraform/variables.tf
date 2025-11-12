variable "domain_name" {
  description = "Root domain"
  type        = string
  default     = "marlonvaldes.cc"
}

variable "aws_region" {
  description = "Region where your S3 website bucket lives"
  type        = string
  default     = "us-east-2"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket serving the site (should match domain)"
  type        = string
  default     = "marlonvaldes.cc"
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token with DNS:Edit and Zone:Read"
  type        = string
  sensitive   = true
}
