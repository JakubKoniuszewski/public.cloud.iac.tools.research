terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "intense-pointer-433019-d6"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

# Define or update the firewall rule to allow traffic on port 2222
# Define the firewall rule to allow traffic on port 2222 from the IP range 35.235.240.0/20
resource "google_compute_firewall" "ssh-rule" {
  name = "terraform-instance-ssh"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  target_tags = ["terraform-instance"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  zone         = "europe-central2-a"  # Specify the zone here
  boot_disk {
    initialize_params {
      # image = "debian-cloud/debian-11"
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
