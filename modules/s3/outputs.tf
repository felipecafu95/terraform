output "bucket" {
  value = "${aws_s3_bucket.generic-bucket.bucket}"
}

output "arn" {
  value = "${aws_s3_bucket.generic-bucket.arn}"
}

