variable vms {
    default = [
        {
            name = "vm1",
            network = "domain1",
            tags = ["prvi", "http"]
        },
        {
            name = "vm2",
            network = "domain3",
            tags = ["drugi", "http"]
        }
    ]
}

variable gcp_zone {}
variable gcp_region {}