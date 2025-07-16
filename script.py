@@ -13,3 +13,10 @@ resource "aws_instance" "example" {
 resource "aws_s3_bucket" "example" {
   bucket = "env0-test-bucket"
 }
+
+resource "aws_s3_bucket" "new_bucket" {
+  bucket = "env0-test-bucket-new"
+  acl    = "private"
+
+  versioning { enabled = true }
+}