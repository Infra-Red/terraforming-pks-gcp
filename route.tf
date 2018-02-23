resource "google_compute_route" "nat-pri" {
  name = "${var.env_prefix}-nat-pri"
  network = "${google_compute_network.pks-network.name}"
  dest_range = "0.0.0.0/0"
  priority = 800
  tags = ["${var.env_prefix}"]
  next_hop_instance = "${google_compute_instance.nat-instance-pri.name}"
  next_hop_instance_zone = "${google_compute_instance.nat-instance-pri.zone}"
}

resource "google_compute_route" "nat-sec" {
  name = "${var.env_prefix}-nat-sec"
  network = "${google_compute_network.pks-network.name}"
  dest_range = "0.0.0.0/0"
  priority = 800
  tags = ["${var.env_prefix}"]
  next_hop_instance = "${google_compute_instance.nat-instance-sec.name}"
  next_hop_instance_zone = "${google_compute_instance.nat-instance-sec.zone}"
}

resource "google_compute_route" "nat-ter" {
  name = "${var.env_prefix}-nat-ter"
  network = "${google_compute_network.pks-network.name}"
  dest_range = "0.0.0.0/0"
  priority = 800
  tags = ["${var.env_prefix}"]
  next_hop_instance = "${google_compute_instance.nat-instance-ter.name}"
  next_hop_instance_zone = "${google_compute_instance.nat-instance-ter.zone}"
}
