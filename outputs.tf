output "Default Deployment Tag" {
  value = "${var.env_prefix}"
}

output "AuthJSON" {
  sensitive = true
  value = "${var.service_account_key}"
}

output "Availability Zones" {
  value = "${var.zones}"
}

output "Infrastructure Network Name" {
  value = "pks-infrastructure"
}

output "Infrastructure Network Google Network Name " {
  value = "${var.env_prefix}-virt-net/${var.env_prefix}-subnet-infrastructure-${var.region}/${var.region}"
}

output "Infrastructure Network CIDR" {
  value = "${var.infrastructure_cidr}"
}

output "Infrastructure Network Reserved IP Ranges" {
  value = "${cidrhost(var.infrastructure_cidr, 1)}-${cidrhost(var.infrastructure_cidr, 9)}"
}

output "Infrastructure Network DNS" {
  value = "169.254.169.254"
}

output "Infrastructure Network Gateway" {
  value = "${cidrhost(var.infrastructure_cidr, 1)}"
}

output "Main Network Name" {
  value = "pks-main"
}

output "Main Network Google Network Name " {
  value = "${var.env_prefix}-virt-net/${var.env_prefix}-subnet-pks-${var.region}/${var.region}"
}

output "Main Network CIDR" {
  value = "${var.pks_cidr}"
}

output "Main Network Reserved IP Ranges" {
  value = "${cidrhost(var.pks_cidr, 1)}-${cidrhost(var.pks_cidr, 9)}"
}

output "Main Network DNS" {
  value = "169.254.169.254"
}

output "Main Network Gateway" {
  value = "${cidrhost(var.pks_cidr, 1)}"
}

output "Service Network Name" {
  value = "pks-services"
}

output "Service Network Google Network Name " {
  value = "${var.env_prefix}-virt-net/${var.env_prefix}-subnet-services-${var.region}/${var.region}"
}

output "Service Network CIDR" {
  value = "${var.services_cidr}"
}

output "Services Network Reserved IP Ranges" {
  value = "${cidrhost(var.services_cidr, 1)}-${cidrhost(var.services_cidr, 9)}"
}

output "Services Network DNS" {
  value = "169.254.169.254"
}

output "Services Network Gateway" {
  value = "${cidrhost(var.services_cidr, 1)}"
}

output "pks_master_node_service_account_key" {
  value = "${base64decode(element(concat(google_service_account_key.pks_master_node_service_account_key.*.private_key, list("")), 0))}"
}

output "pks_worker_node_service_account_key" {
  value = "${base64decode(element(concat(google_service_account_key.pks_worker_node_service_account_key.*.private_key, list("")), 0))}"
}