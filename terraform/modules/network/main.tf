resource "google_compute_subnetwork" "default" {
  name          = var.name
  ip_cidr_range = var.subnet
  region        = "europe-north1"
  network       = var.network
}