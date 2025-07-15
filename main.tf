provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  tags = {
    Name = "env0-test-instance"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "env0-test-bucket"
}

resource "aws_s3_bucket" "new_bucket" {
  bucket = "env0-test-bucket-new"
}
