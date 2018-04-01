variable "project" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "zones" {
  type = "list"
}

variable "nat_machine_type" {
  default = "n1-standard-4"
  type = "string"
}

variable "opsman_machine_type" {
  default = "n1-standard-2"
  type = "string"
}

variable "service_account_key" {
  type = "string"
}

variable "env_prefix" {
  type = "string"
}

variable "infrastructure_cidr" {
  type        = "string"
  description = "cidr for infrastructure subnet"
  default     = "192.168.101.0/26"
}

variable "pks_cidr" {
  type        = "string"
  description = "cidr for pks subnet"
  default     = "192.168.16.0/26"
}

variable "services_cidr" {
  type        = "string"
  description = "cidr for services subnet"
  default     = "192.168.20.0/22"
}

variable "opsman_image_url" {
  type = "string"
}

variable "pks_lb_count" {
  type    = "string"
  default = 1
}

