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

  project = "sixth-beaker-366215"
  region  = var.region
  zone    = var.zone
}