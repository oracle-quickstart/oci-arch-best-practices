data "oci_cloud_guard_detector_recipes" "oci_original_detector" {
    compartment_id = var.compartment_ids["root_compartment"]
    display_name = "OCI Activity Detector Recipe"
}
data "oci_cloud_guard_responder_recipes" "oci_original_responder" {
    #Required
    compartment_id = var.compartment_ids["root_compartment"]
    display_name =  "OCI Responder Recipe"
}