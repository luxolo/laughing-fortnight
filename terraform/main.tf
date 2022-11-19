resource "google_compute_network" "vpc_network" {
  name                    = var.test-network
  auto_create_subnetworks = false
  mtu                     = 1460
}

module "network" {
  source   = "./modules/network"
  for_each = toset(var.domains)
  subnet   = "10.0.${index(var.domains, each.value) + 1}.0/24"
  name     = each.value
  network  = google_compute_network.vpc_network.name
}

## WORKAROUND TO CREATE DIRECTORIES/TF-PROJECTS LOCALLY ##

module directories {
  source = "./modules/directories"
  for_each = toset(var.domains)
  name = each.value
}

## REPLACES CREATING GITHUB
resource "local_file" "dirs" {
  for_each = module.network
  content  = <<-EOT
      gcp_region                = "${var.region}"
      gcp_zone                  = "${var.zone}"
      project_name              = "${each.key}"
      project_id                = "${var.project_id}"
      project_subnet_self_link  = "${each.value.self_link}"
  EOT
  filename = "C:\\Users\\tomis\\GCP-git\\laughing-fortnight\\${each.key}\\${each.key}.tfvars"
}

