terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region  = "us-east-2" # make sure this matches your intended region
  profile = "default"
}

# S3 bucket for static website
resource "aws_s3_bucket" "website" {
  bucket = "marlonvaldes.cc"

  tags = {
    Name        = "marlonvaldes.cc"
    Environment = "production"
  }
}

# Enable public website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Public access block - allows public policies
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.website.id
  block_public_acls       = false
  block_public_policy     = false # <-- needed to allow public bucket policy
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Public read bucket policy
resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })
}

# Output website endpoint
output "s3_website_endpoint" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}
