data "oci_cloud_guard_detector_recipes" "oci_original_detector" {
    compartment_id = var.tenancy_ocid
    display_name = "OCI Activity Detector Recipe"
}
data "oci_cloud_guard_responder_recipes" "oci_original_responder" {
    #Required
    compartment_id = var.tenancy_ocid
    display_name =  "OCI Responder Recipe"
}
data "oci_identity_compartments" "sub_org1" {
  compartment_id = var.tenancy_ocid
  compartment_id_in_subtree = true
  access_level              = "ANY"
  filter {
    name   = "name"
    values = ["SubOrg1"]
  }
}
data "oci_identity_compartments" "sub_org2" {
  compartment_id = var.tenancy_ocid
  compartment_id_in_subtree = true
  access_level              = "ANY"
  filter {
    name   = "name"
    values = ["SubOrg2"]
  }
}