resource "aws_s3_bucket" "new_bucket" {
  bucket = "env0-test-bucket-new"

  tags = {
    Name        = "env0-test-bucket-new"
    Environment = "test"
    Owner       = "infra-team"
    Project     = "env0-test-infra"
    Terraform   = "true"
  }
}

resource "aws_s3_bucket_versioning" "new_bucket" {
  bucket = aws_s3_bucket.new_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "new_bucket" {
  bucket = aws_s3_bucket.new_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "new_bucket" {
  bucket = aws_s3_bucket.new_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "new_bucket" {
  bucket = aws_s3_bucket.new_bucket.id

  rule {
    id     = "auto-cleanup"
    status = "Enabled"

    expiration {
      days = 90
    }

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}