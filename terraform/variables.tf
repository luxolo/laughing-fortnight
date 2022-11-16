variable zone {
    default = "europe-north1-a"
}

variable region {
    default = "europe-north1"
}

variable domains {
    default = ["domain1", "domain2", "domain3"]
}

variable test-network {
    default = "terraform-network"
}

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