variable "user_data_file" {
  default = ""
  
}
variable "image_id" {
  default = ""
}

variable "instance_type" {
  default = ""
}

variable "key_name" {
  default = ""
}
variable "name_prefix" {
  default = ""
}
variable "security_groups" {
  default = []
}
variable "volume_size" {
  default = 10
}

variable "azs" {
  default = []
}

variable "policy_name" {
  default = ""
}

variable "as_group_name" {
  default = ""
}

variable "max_size" {
  default = 0
}

variable "desired_capacity" {
  default = 0
}

variable "min_size" {
  default = 0
}

variable "health_grace" {
  default = 0
}

variable "health_type" {
  default = ""
}

variable "vpc_id" {
  default = []
}

variable "iam_instance_profile" {
  default = ""
}

variable "instance_name" {
  default = ""
}

variable "system" {
  default = ""
}

variable "env" {
  default = ""
}
