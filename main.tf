resource "aws_s3_bucket" "new_bucket" {
  bucket = "env0-test-bucket-new"
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  lifecycle {
    prevent_destroy = true
  }
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "logs/"
  }
  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}
resource "aws_s3_bucket_public_access_block" "new_bucket" {
  bucket = aws_s3_bucket.new_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}