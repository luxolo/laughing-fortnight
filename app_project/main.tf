module "internal_VM" {
  source = "./modules/internal_VM"
  for_each = {
    for item in var.vms : item.name => item   
  }
  name = each.key
  zone = var.gcp_zone
  tags = each.value.tags
  network = var.project_subnet_self_link
}