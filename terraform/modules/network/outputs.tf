output "subnets_used" {
  value = values(google_compute_subnetwork.default)[*]
}