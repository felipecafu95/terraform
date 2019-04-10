variable "name" {
  default = ""
}
variable "internal" {
  default = ""
}
variable "type" {
  default = ""
}
variable "security_groups" {
  default = []
}
variable "subnets" {
  default = []
}

variable "tag_env" {
  default = ""
}

variable "tag_name" {
  default = ""
}

variable "tg_name" {
  default = ""
}
variable "port" {
  default = ""
}variable "protocol" {
  default = ""
}
variable "vpc_id" {
  default = ""
}
variable "deregistration_delay" {
  default = 0
}

variable "slow_start" {
  default = 0
}

variable "listener-port" {
  default = ""
}

variable "listener-protocol" {
 default = "" 
}

variable "deletion_protection" {
  default = ""
}
variable "target_id" {
  default = ""
}

variable "tg_port" {
  default = 0
}
