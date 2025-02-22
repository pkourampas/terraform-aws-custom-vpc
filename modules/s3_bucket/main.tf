# Creates a S3 bucket
resource "aws_s3_bucket" "backend" {
  bucket = var.name
  force_destroy = true

  tags = {
    Name = var.name
  }
}
