resource "oci_core_drg" "drg" {
    for_each        = var.dynamic_router_gw_list
    compartment_id  = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    display_name    = each.key
}