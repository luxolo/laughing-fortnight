output "subnets_used" {
  value = values(google_compute_subnetwork.default)[*]
}

output "self_link" {
  value = google_compute_subnetwork.default.self_link
}