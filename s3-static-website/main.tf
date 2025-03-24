# Generate a unique suffix for the bucket name
resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
  upper   = false
}

# S3 Bucket with a unique name
resource "aws_s3_bucket" "website_bucket" {
  bucket = "my-static-site-${random_string.bucket_suffix.result}"
}

# Enable S3 Website Hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Disable public access blocking
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Public Bucket Policy to allow access to everyone
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.website_bucket.id}/*"
      }
    ]
  }
  POLICY
}

# Outputs the Website URL
output "s3_bucket_name" {
  value = aws_s3_bucket.website_bucket.id
}

output "s3_website_url" {
  value = aws_s3_bucket_website_configuration.website_config.website_endpoint
}
