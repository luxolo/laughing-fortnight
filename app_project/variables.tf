variable "vms" {
    default = [
        {
            name = "vm1",
            tags = ["prvi", "http"]
        },
        {
            name = "vm2",
            tags = ["drugi", "http"]
        }
    ]
}

variable "gcp_zone" {}
variable "gcp_region" {}
variable "project_id" {}
variable "project_name" {}
variable "project_subnet_self_link" {}