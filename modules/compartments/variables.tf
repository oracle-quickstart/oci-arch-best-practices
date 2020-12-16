variable tenancy_ocid   {}
variable target_ocid    {}
variable delete_timeout {}
variable "compartment_enable_delete" {
  default = true
}
variable level_one_entities {
    type = set(string)
    default = [
        "branch_one",
        "branch_two",
        "network",
    ]
}