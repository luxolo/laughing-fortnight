terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.41.0"
    }
  }
}

provider "google" {
  credentials = file("/home/tommij/private/sixth-beaker-366215-d226ab743aa8.json")

  project = "sixth-beaker-366215"
  region  = var.region
  zone    = var.zone
}