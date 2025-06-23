resource "aws_s3_bucket" "main" {
  bucket = "${var.environment}-s3-bucket"
  force_destroy = true
  tags = {
    Name = "${var.environment}-s3-bucket"
    ENV  = var.environment
  }
}
