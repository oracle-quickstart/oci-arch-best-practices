variable tenancy_ocid   {}
variable target_ocid    {}
variable delete_timeout {}
variable "compartment_enable_delete" {
  default = true
}
variable level_one_entities {
    type = set(string)
    default = [
        "SubOrg1",
        "SubOrg2",
        "network",
    ]
}

variable "company_environment_list" {
  type = set(string)
  default = [
    "prd",
    "dev",
    "qas",
  ]
  
}