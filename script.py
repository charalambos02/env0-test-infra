@@ -13,3 +13,9 @@ resource "aws_instance" "example" {
 resource "aws_s3_bucket" "example" {
   bucket = "env0-test-bucket"
 }
+
+resource "aws_s3_bucket" "new_bucket" {
+  bucket        = "env0-test-bucket-new"
+  force_destroy = true
+}