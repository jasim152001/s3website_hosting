provider "aws" {
  version = "~>3.0"
  region = "eu-west-3"
}
resource "aws_s3_bucket" "s3" {
  bucket = "jasimpm152001bucket"
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
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.s3.id
  acl    = "public-read"
}
output "s3_website_url" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}
