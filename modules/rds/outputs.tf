output "db_name" {
  value = "${aws_db_instance.generic_db.name}"
}

output "endpoint" {
  value = "${aws_db_instance.generic_db.endpoint}"
}

output "username" {
  value = "${aws_db_instance.generic_db.username}"
}

output "engine" {
  value = "${aws_db_instance.generic_db.engine}"
}

output "arn" {
  value = "${aws_db_instance.generic_db.arn}"
}
output "status" {
  value = "${aws_db_instance.generic_db.status}"
}
