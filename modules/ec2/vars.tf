variable "image_id" {
  default = ""
}

variable "instance_name" {
  default = ""
}

variable "instance_type" {
  default =  ""
}

variable "az" {
  default = ""
}
variable "key_name" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "sg_ids" {
  default = []
}
variable "tenancy" {
  default = ""
}

variable "ami" {
  default = ""
}

variable "user_data" {
  default = ""
}
variable "iam_instance_profile" {
  default = ""
}
variable "environment" {
  default = ""
}
variable "volume_size" {
  default = 0
}
variable "volume_type" {
  default = ""
}
