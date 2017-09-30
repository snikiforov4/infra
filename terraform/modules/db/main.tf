resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  metadata {
    sshKeys = "appuser:${file("${var.public_key_path}")}"
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  tags = ["reddit-db", "db"]
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "default-allow-mongo"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  target_tags = ["reddit-db"]
  source_tags = ["reddit-app"]
}
