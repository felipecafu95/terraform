resource "aws_db_subnet_group" "db_subnet" {
  name        = "${var.subnet_db-name}"
  subnet_ids  = ["${var.subnet_ids}"]
  description = "${var.description}"

  tags = {
    Name = "${var.subnet_tagname}"
  }
}

resource "aws_db_instance" "generic_db" {
  allocated_storage       = "${var.db_storage}"
  identifier              = "${var.identifier}"
  storage_type            = "${var.storage_type}"
  engine                  = "${var.engine}"
  engine_version          = "${var.engine_version}"
  instance_class          = "db.${var.instance_type}"
  name                    = "${var.db_name}"
  username                = "${var.db_username}"
  db_subnet_group_name    = "${aws_db_subnet_group.db_subnet.name}"
  password                = "${var.db_password}"
  backup_retention_period = "${var.backup_period}"
  parameter_group_name    = "${var.parameter_group_name}"
  multi_az                = "${var.multi_az}"
  publicly_accessible     = "${var.pub_access}"
  vpc_security_group_ids  = "${var.vpc_security_group_ids}"
  copy_tags_to_snapshot   = "${var.copy_tags_to_snapshot }"
  monitoring_interval     = "${var.monitoring_interval }"
  skip_final_snapshot     = "${var.skip_final_snapshot}"
}
