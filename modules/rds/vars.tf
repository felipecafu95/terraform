variable "db_storage" {}
variable "storage_type" {}
variable "engine" {}
variable "identifier" {}
variable "engine_version" {}
variable "instance_type"   {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" { }
variable "backup_period" {}
variable "parameter_group_name" {}
variable "multi_az" {}
variable "pub_access" {}
variable "vpc_security_group_ids" { type = "list" }
variable "copy_tags_to_snapshot" {} 
variable "monitoring_interval" {}
variable "db_subnet_group_name" {}
variable "skip_final_snapshot" {}
