resource "oci_core_route_table" "hub_lpg" {
    for_each                = var.spoke_vcn_list
    compartment_id          = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    vcn_id                  = oci_core_vcn.vcns["hub"].id
    display_name            = "rt_${each.key}"
    route_rules {
        description         = "On Primeses + All External Route Summary"
        destination         = var.on_primeses_summary_cidr
        destination_type    = "CIDR_BLOCK"
        network_entity_id   =  oci_core_drg.drg["drg_hub"].id
    }
}