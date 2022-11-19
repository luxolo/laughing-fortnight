terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.41.0"
    }
  }
}

provider "google" {
  # credentials = file("/home/tommij/private/${var.project_id}-d226ab743aa8.json")
  credentials = file("C:\\Users\\tomis\\GCP-git\\${var.project_id}-d226ab743aa8.json")

  project = var.project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}