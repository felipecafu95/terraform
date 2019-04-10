resource "aws_cloudwatch_log_group" "dmesg" {
  name              = "${var.cloudwatch_prefix}/var/log/dmesg"
  retention_in_days = "${var.retention_in_days}"
}

resource "aws_cloudwatch_log_group" "docker" {
  name              = "${var.cloudwatch_prefix}/var/log/docker"
  retention_in_days = "${var.retention_in_days}"
}

resource "aws_cloudwatch_log_group" "ecs-agent" {
  name              = "${var.cloudwatch_prefix}/var/log/ecs/ecs-agent.log"
  retention_in_days = "${var.retention_in_days}"
}

resource "aws_cloudwatch_log_group" "ecs-init" {
  name              = "${var.cloudwatch_prefix}/var/log/ecs/ecs-init.log"
  retention_in_days = "${var.retention_in_days}"
}

resource "aws_cloudwatch_log_group" "audit" {
  name              = "${var.cloudwatch_prefix}/var/log/ecs/audit.log"
  retention_in_days = "${var.retention_in_days}"
}

resource "aws_cloudwatch_log_group" "messages" {
  name              = "${var.cloudwatch_prefix}/var/log/messages"
  retention_in_days = "${var.retention_in_days}"
}