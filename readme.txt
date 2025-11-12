Full Terraform IaC deployment

S3 to host static site

Github Actions for CI/CD Pipeline

AWS Cloudfront/ACM for CDN / HTTPS

Cloudflare for DNS / OPTIONAL PROXY

Lambda for serverless back end function to power visitor counte ron site

Dynamodb to store and fetch visitor count and manipulate the data


----------------


CloudFront handles AWS-native performance + SSL termination.

Cloudflare gives you DNS control and optional global edge caching.

You can toggle the orange cloud on/off easily depending on whether you want Cloudflare to proxy or just resolve DNS.

You can later add Lambda@Edge or CloudFront Functions for custom behaviors (like redirects or headers) — all Terraform-managed.
