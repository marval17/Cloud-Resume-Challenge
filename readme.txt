🧱 Current Architecture (Serverless + Managed)

Right now, your stack is entirely serverless and declarative via Terraform:

Frontend: S3 static website

Global delivery: CloudFront (pending AWS approval) + Cloudflare DNS

Backend: API Gateway + Lambda

Database: DynamoDB (serverless key–value)

Infra management: Terraform + GitHub Actions (CI/CD)

✅ Pros

No servers to manage

Low cost (pay-per-use)

Simple scaling (AWS auto-handles Lambda concurrency)

Great fit for a personal/resume project

------------------

Full Terraform IaC deployment

S3 to host static site

Github Actions for CI/CD Pipeline

AWS Cloudfront/ACM for CDN / HTTPS / SSL Termination

Cloudflare for DNS / OPTIONAL PROXY

API Gateway calls lambda every time a visitor loads the site

Lambda for serverless back end function to power visitor counter on site

Dynamodb to store and fetch visitor count and manipulate the data


----------------
