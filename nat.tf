resource "google_compute_instance" "nat-instance-pri" {
  name         = "${var.env_prefix}-nat-gateway-pri"
  machine_type = "${var.nat_machine_type}"
  zone         = "${element(var.zones, 0)}"
  tags         = ["nat-traverse", "${var.env_prefix}-nat-instance"]

  can_ip_forward = true

  timeouts {
    create = "10m"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1404-lts"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.infrastructure-subnet.name}"
    address = "${cidrhost(var.infrastructure_cidr, 2)}"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<SCRIPT
#! /bin/bash
sudo sh -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
SCRIPT
}

resource "google_compute_instance" "nat-instance-sec" {
  name         = "${var.env_prefix}-nat-gateway-sec"
  machine_type = "${var.nat_machine_type}"
  zone         = "${element(var.zones, 1)}"
  tags         = ["nat-traverse", "${var.env_prefix}-nat-instance"]

  can_ip_forward = true

  timeouts {
    create = "10m"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1404-lts"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.infrastructure-subnet.name}"
    address = "${cidrhost(var.infrastructure_cidr, 3)}"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<SCRIPT
#! /bin/bash
sudo sh -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
SCRIPT
}

resource "google_compute_instance" "nat-instance-ter" {
  name         = "${var.env_prefix}-nat-gateway-ter"
  machine_type = "${var.nat_machine_type}"
  zone         = "${element(var.zones, 2)}"
  tags         = ["nat-traverse", "${var.env_prefix}-nat-instance"]

  can_ip_forward = true

  timeouts {
    create = "10m"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1404-lts"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.infrastructure-subnet.name}"
    address = "${cidrhost(var.infrastructure_cidr, 4)}"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<SCRIPT
#! /bin/bash
sudo sh -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
SCRIPT
}
