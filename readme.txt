🧱 Current Architecture (Serverless + Managed)
<<<<<<< HEAD

Stack is entirely serverless and declarative via Terraform:

Frontend: S3 static website (HTML + JS + CSS)

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
=======
>>>>>>> dfc168c (rearrange folder structure)

Stack is entirely serverless and declarative via Terraform:

Frontend: S3 static website (HTML + JS + CSS)

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

Developer (local repo)
      |
      v
Git push -> GitHub Actions CI/CD 
      |
      v
Package static files (site/)  ----------------------------┐
Upload to S3 bucket (terraform/s3.tf)                     |
      |                                                   |  
      v                                                   |
CloudFront distribution w/ ACM cert            (terraform/cloudfront.tf)
      |
      v
Cloudflare DNS (root/www records + optional page rule) (terraform/cloudflare.tf)
      |
   End users hit https://marlonvaldes.cc
      |
      v
Browser loads static site (site/index.html) and calls visitor counter JS
      |
      v
API Gateway HTTP API (terraform/counter.tf)
      |
      v
Lambda visitor_counter (terraform/lambda/visitor_counter.py)
      |
      v
DynamoDB table visitor_count (terraform/counter.tf)

----------------