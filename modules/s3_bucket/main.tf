# Creates a S3 bucket
resource "aws_s3_bucket" "backend" {
  bucket = var.name
  region = var.s3-bucket-region
  force_destroy = true

  tags = {
    Name = var.name
  }
}
