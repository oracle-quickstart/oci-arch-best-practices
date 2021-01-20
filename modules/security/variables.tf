variable tenancy_ocid {}
variable target_compartment_ocid  {}
variable "cloud_guard_configuration_status" {
    default = "ENABLED"
}
variable compartments_to_monitor {
    type = set(string)
    default = [
        "root_compartment",
        "SubOrg1",
        "SubOrg2"
    ] 
}
variable deployment_regions {
    type = set(string)
    default = [
        "us-ashburn-1",
    ] 
}

variable vault_config {
    type = map
    default = {
        vault_1_type = "DEFAULT"
        vault_1_name = "vault1"
    }
}