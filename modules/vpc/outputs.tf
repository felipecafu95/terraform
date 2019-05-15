output "vpc_id" {
  value = "${aws_vpc.generic_vpc.id}"
}

output "subnet_pub" {
  value = "${aws_subnet.generic_pub_subnet.*.id}"
}

output "subnet_pvt" {
  value = "${aws_subnet.generic_pvt_subnet.*.id}"
}

output "subnet_db" {
  value = "${aws_subnet.generic_db_pvt_subnet.*.id}"
}
