variable "environment_name" {
  type = string
}

variable "owner_name" {
  type = string
}

variable "ttl" {
  type    = number
  default = 48
}

variable "name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_groups" {
  type    = list(string)
  default = null
}

variable "instances" {
  type = list(string)
}

variable "listeners" {
  type = list
  default = [{
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }]
}

variable "health_check_target" {
  type    = string
  default = "http:80/"
}


variable "tags" {
  type    = map
  default = null
}
