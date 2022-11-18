# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.default.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}