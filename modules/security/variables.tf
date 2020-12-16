variable tenancy_ocid {}
variable target_ocid {}
variable "cloud_guard_configuration_status" {
    default = "ENABLED"
}
variable compartments_to_monitor {
    type = set(string)
    default = [
        "root_compartment",
        "target_compartment"
    ] 
}
variable deployment_regions {
    type = set(string)
    default = [
        "us-ashburn-1",
    ] 
}
variable compartment_ids {
    type = map
    default = {
        root_compartment   = "ocid1.tenancy.oc1..aaaaaaaatntrdradqcdn3qjylxb4kimtwtjb65lb5ubrnoa4izaabd2hijpq"
        target_compartment = "ocid1.compartment.oc1..aaaaaaaahd764m4cwsgbpdj5tu7civp3wqmxdi7prju3e6k7roxunhzfgmca"
    }
}

variable vault_config {
    type = map
    default = {
        vault_1_type = "DEFAULT"
        vault_1_name = "target"
    }
}