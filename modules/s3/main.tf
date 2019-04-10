resource "aws_s3_bucket" "generic-bucket" {
  bucket = "${var.bucket_name}"
  acl    = "${var.bucket_acl}"
  region = "${var.region}"

  tags = {
    Name        = "${var.tag_name}"
    Environment = "${var.tag_environemnt}"
  }
  versioning {
    enabled = "${var.versioning}"
  }
}

