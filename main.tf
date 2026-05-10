terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
    bucket = "terraform-139727352662-eu-west-1"
    key    = "testing/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
  allowed_account_ids = [
    "139727352662"

  ]
}

resource "aws_s3_bucket" "test" {
  bucket = "test-bucket-139727352662-eu-west-1"
  tags = {
    Environment = "Test"
  }
}

resource "aws_s3_bucket_public_access_block" "test" {
  bucket                  = aws_s3_bucket.test.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
