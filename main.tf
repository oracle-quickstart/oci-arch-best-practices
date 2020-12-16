
terraform {
    required_providers {
        // Commented due the current versions for OCI RMS do not support version 0.13 yet.
    oci  = {
      source        = "hashicorp/oci"
      version       =  "~>4.5.0"
      }
    null = "~>2.1.2"
}
  required_version  = "~>0.13"
}

module "hoes-security_and_compliance" {
    /*
    Cloud Guard
    Vault
    */
    source = "./modules/security"
    tenancy_ocid    = "ocid1.tenancy.oc1..aaaaaaaatntrdradqcdn3qjylxb4kimtwtjb65lb5ubrnoa4izaabd2hijpq"
    target_ocid     = "ocid1.compartment.oc1..aaaaaaaahd764m4cwsgbpdj5tu7civp3wqmxdi7prju3e6k7roxunhzfgmca"
}
module "hoes-security_and_compliance_iam" {
    /*
    Group
    Polices for:
     - Tenancy Admin Role + MFA + DELETE
     - Tenancy Security Role
     - Tenancy Auditors Role
     - Service Admin Role +MFA -DELETE USE NETWORK
     - Service Operators Role
    */
    source = "./modules/iam"
    tenancy_ocid    = "ocid1.tenancy.oc1..aaaaaaaatntrdradqcdn3qjylxb4kimtwtjb65lb5ubrnoa4izaabd2hijpq"
    delete_timeout  = "3h"
    target_ocid     = "ocid1.compartment.oc1..aaaaaaaahd764m4cwsgbpdj5tu7civp3wqmxdi7prju3e6k7roxunhzfgmca"
}
module "hoes-security_and_compliance_tags" {
    source = "./modules/tags"
    tenancy_ocid    = "ocid1.tenancy.oc1..aaaaaaaatntrdradqcdn3qjylxb4kimtwtjb65lb5ubrnoa4izaabd2hijpq"
    delete_timeout  = "3h"
}
module "hoes-security_and_compliance_compartments" {
    source = "./modules/compartments"
    tenancy_ocid    = "ocid1.tenancy.oc1..aaaaaaaatntrdradqcdn3qjylxb4kimtwtjb65lb5ubrnoa4izaabd2hijpq"
    target_ocid     = "ocid1.compartment.oc1..aaaaaaaahd764m4cwsgbpdj5tu7civp3wqmxdi7prju3e6k7roxunhzfgmca"
    delete_timeout  = "3h"
}
module "hoes-reliability_and_resilience" {
    source = "./modules/basic_foundation"
    tenancy_ocid    = "ocid1.tenancy.oc1..aaaaaaaatntrdradqcdn3qjylxb4kimtwtjb65lb5ubrnoa4izaabd2hijpq"
    depends_on = [module.hoes-security_and_compliance_compartments]
    
}