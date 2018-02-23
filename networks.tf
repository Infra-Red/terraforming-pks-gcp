resource "google_compute_network" "pks-network" {
  name = "${var.env_prefix}-virt-net"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "infrastructure-subnet" {
  name          = "${var.env_prefix}-subnet-infrastructure-${var.region}"
  ip_cidr_range = "${var.infrastructure_cidr}"
  network       = "${google_compute_network.pks-network.self_link}"
  region        = "${var.region}"
}

resource "google_compute_subnetwork" "pks-subnet" {
  name          = "${var.env_prefix}-subnet-pks-${var.region}"
  ip_cidr_range = "${var.pks_cidr}"
  network       = "${google_compute_network.pks-network.self_link}"
  region        = "${var.region}"
}

resource "google_compute_subnetwork" "services-subnet" {
  name          = "${var.env_prefix}-subnet-services-${var.region}"
  ip_cidr_range = "${var.services_cidr}"
  network       = "${google_compute_network.pks-network.self_link}"
  region        = "${var.region}"
}
