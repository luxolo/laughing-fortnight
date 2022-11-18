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
    network = var.network
  }

  metadata_startup_script = "../scripts/startup_script.sh"
}


