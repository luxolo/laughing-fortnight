resource "null_resource" "example2" {
  provisioner "local-exec" {
    command = "mkdir C:\\Users\\tomis\\GCP-git\\laughing-fortnight\\${var.name}"
  }
  provisioner "local-exec" {
    command = "mkdir C:\\Users\\tomis\\GCP-git\\laughing-fortnight\\${var.name}\\modules"
  }
  provisioner "local-exec" {
    command = "mkdir C:\\Users\\tomis\\GCP-git\\laughing-fortnight\\${var.name}\\external_VM"
  }
  provisioner "local-exec" {
    command = "mkdir C:\\Users\\tomis\\GCP-git\\laughing-fortnight\\${var.name}\\internal_VM"
  }
  
}
