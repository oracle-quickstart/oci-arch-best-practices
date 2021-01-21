terraform {
    required_providers {
        // Commented due the current versions for OCI RMS do not support version 0.13 yet.
    oci  = {
      source        = "hashicorp/oci"
      version       =  "~>4.5.0"
      }
    null = "~>2.1.2"
    }

    required_version  = "~>0.14"
}

provider oci {
    region = "us-ashburn-1"
}
provider oci {
    alias = "home"
    region = "us-phoenix-1"
}

locals {
    // Add your tenacy identification here.
    // To work in a sandbox you can deploy the code using the target_ocid  variable
    // If you whant to deploy directly you can set the tenancy ocid to bhoth variables tenancy_ocid and target_ocid
    tenancy_ocid    = "ocid1.tenancy.oc1..<<ADD TENANCY ID>>"
    target_ocid     = "ocid1.compartment.oc1..<<ADD TARGET IF YOU WHANT TEST ISOLATED ID>>"
    delete_timeout  = "3h"
}

module "hoes-security_and_compliance_tags" {
    source = "./modules/tags"
    providers       = {
        oci = oci.home
    }
    tenancy_ocid    = local.tenancy_ocid
    delete_timeout  = local.delete_timeout
}
module "hoes-security_and_compliance_compartments" {
    depends_on = [ module.hoes-security_and_compliance_tags ]
    source          = "./modules/compartments"
    providers       = {
        oci = oci.home
    }
    tenancy_ocid    = local.tenancy_ocid
    target_ocid     = local.target_ocid
    delete_timeout  = local.delete_timeout
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
    providers       = {
        oci = oci.home
    }
    tenancy_ocid    = local.tenancy_ocid
    target_ocid     = local.target_ocid
    delete_timeout  = local.delete_timeout
}
/*
    Cloud Guard
    Vault
*/
module "hoes-security_and_compliance" {
    depends_on = [ module.hoes-security_and_compliance_compartments ]
    source = "./modules/security"
    tenancy_ocid    = local.tenancy_ocid
    target_compartment_ocid     = local.target_ocid
}
module "hoes-reliability_and_resilience" {
    depends_on = [module.hoes-security_and_compliance_compartments]
    source = "./modules/virtual_networking"
    tenancy_ocid    = local.tenancy_ocid
    
}

