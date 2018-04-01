resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.env_prefix}-allow-ssh"
  network = "${google_compute_network.pks-network.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-ssh"]
}

resource "google_compute_firewall" "allow-http" {
  name    = "${var.env_prefix}-allow-http"
  network = "${google_compute_network.pks-network.name}"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-http", "router"]
}

resource "google_compute_firewall" "allow-https" {
  name    = "${var.env_prefix}-allow-https"
  network = "${google_compute_network.pks-network.name}"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-https", "router"]
}

resource "google_compute_firewall" "allow-pks-all" {
  name    = "${var.env_prefix}-allow-pks-all"
  network = "${google_compute_network.pks-network.name}"
  allow {
    protocol = "tcp"
  }
  allow {
    protocol = "udp"
  }
  allow {
    protocol = "icmp"
  }
  source_tags = ["${var.env_prefix}", "${var.env_prefix}-opsman", "nat-traverse"]
  target_tags = ["${var.env_prefix}", "${var.env_prefix}-opsman", "nat-traverse"]
}

// Allow access to master nodes
resource "google_compute_firewall" "pks-master" {
  name    = "${var.env_prefix}-pks-master"
  network = "${google_compute_network.pks-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["8443"]
  }

  target_tags = ["master"]
}

// Allow access to PKS API
resource "google_compute_firewall" "pks-api" {
  name    = "${var.env_prefix}-pks-api"
  network = "${google_compute_network.pks-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["9021", "8443"]
  }

  target_tags = ["${var.env_prefix}-pks-api"]
}
