# Static Website Hosting on AWS S3 using Terraform

## Overview
This project demonstrates how to host a **static website** on **AWS S3** using **Terraform** for Infrastructure as Code (IaC). It automates the creation of an S3 bucket, configures it for website hosting, and applies necessary permissions.

## Features
- 🚀 **Static Website Hosting** on S3
- 🛠 **Automated Deployment** using Terraform
- 🔒 **Public Access Configured** for easy access
- ☁️ **AWS CLI for File Uploads**

## Prerequisites
Ensure you have the following installed:
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)
- An **AWS account** with proper IAM permissions

## Deployment Steps
1. **Initialize Terraform:**
   ```sh
   terraform init
   ```
2. **Plan the infrastructure:**
   ```sh
   terraform plan
   ```
3. **Apply the configuration:**
   ```sh
   terraform apply -auto-approve
   ```
4. **Upload website files to S3:**
   ```sh
   aws s3 cp index.html s3://YOUR_BUCKET_NAME/
   aws s3 cp error.html s3://YOUR_BUCKET_NAME/
   ```

## Accessing the Website
Once deployed, retrieve your website URL:
```sh
terraform output s3_website_url
```
Visit the displayed URL in a browser! 🌍

## Next Steps
- ✅ **Enhance security** with CloudFront
- ✅ **Custom domain** with Route 53
- ✅ **Enable HTTPS** with SSL/TLS

## License
This project is open-source and available for use.

---
Happy Hosting! 🚀

