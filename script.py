resource "aws_s3_bucket" "new_bucket" {
  bucket = "env0-test-bucket-new"
  acl    = "private"
+  versioning {
+    enabled = true
+  }
+  lifecycle_rule {
+    id      = "auto-delete-incomplete"
+    enabled = true
+
+    abort_incomplete_multipart_upload_days = 7
+  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
+ resource "aws_s3_bucket_public_access_block" "new_bucket" {
+   bucket = aws_s3_bucket.new_bucket.id
+
+   block_public_acls       = true
+   block_public_policy     = true
+   ignore_public_acls      = true
+   restrict_public_buckets = true
+ }