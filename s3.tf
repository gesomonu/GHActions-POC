provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-${random_id.this.hex}"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "random_id" "this" {
  keepers = {
    uuid = uuid()
  }

  byte_length = 8
}