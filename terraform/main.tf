resource "google_compute_network" "vpc_network" {
  name                    = var.test-network
  auto_create_subnetworks = false
  mtu                     = 1460
}

module "network" {
  source = "./modules/network"
  for_each = toset(var.domains)
  subnet = "10.0.${index(var.domains, each.value) + 1}.0/24"
  name = each.value
  network = google_compute_network.vpc_network.name
}
