resource "oci_core_drg" "hub_drg" {
    compartment_id  = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    display_name    = "drg_main"
}
