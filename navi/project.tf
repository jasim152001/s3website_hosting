provider "aws" {
  region = "ap-south-1"
  version = "~>3.0"
}
resource "aws_s3_bucket" "s3" {
  bucket = "mnbv"
}
resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.s3.id
  policy = file("policy.json")
}
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.s3.id
  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_bucket_acl" "aclenable" {
  bucket = aws_s3_bucket.s3.id
  acl = "public-read"
}
output "s3-website-url" {
  value = "aws_s3_website_configuration.website.website_endpoint"
}