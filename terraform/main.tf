terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.41.0"
    }
  }
}

provider "google" {
  credentials = file("C:\\Users\\tomis\\GCP-git\\sixth-beaker-366215-d226ab743aa8.json")

  project = "sixth-beaker-366215"
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name                    = var.test-network
  auto_create_subnetworks = false
  mtu                     = 1460
}

# # allow http traffic
# resource "google_compute_firewall" "allow-http" {
#   name = "allow-http"
#   network = "${google_compute_network.vpc_network.name}"
#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }
#   target_tags = ["http"]
#   source_ranges = [tolist(module.network.subnets_used)]
# }

module "network" {
  source = "./modules/network"
  for_each = toset(var.domains)
  subnet = "10.0.${index(var.domains, each.value) + 1}.0/24"
  name = each.value
  network = google_compute_network.vpc_network.name
}

module "internal_VM" {
  source = "./modules/internal_VM"
  depends_on = [module.network]
  for_each = {
    for item in var.vms : item.name => item
  }
  name = each.key
  zone = var.zone
  tags = each.value.tags
  subnetwork = each.value.network
}