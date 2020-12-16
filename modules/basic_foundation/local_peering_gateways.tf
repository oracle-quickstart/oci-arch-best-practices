resource "oci_core_local_peering_gateway" "lpg_hub" {
    for_each        = var.lpg_hub_list
    compartment_id  = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    vcn_id          = oci_core_vcn.vcns["hub"].id
    display_name    = each.key
    peer_id         = (
        each.key == "hub_2_hoes_prd" ? (oci_core_local_peering_gateway.lpg_spoke["hoes_prd_2_hub"].id) : (
            each.key == "hub_2_hoes_dev" ? (oci_core_local_peering_gateway.lpg_spoke["hoes_dev_2_hub"].id) : (
                each.key == "hub_2_hoes_qas" ? (oci_core_local_peering_gateway.lpg_spoke["hoes_qas_2_hub"].id) : null
            )
        )
    )
    route_table_id  =  (
        each.key == "hub_2_hoes_prd" ? (oci_core_route_table.hub_lpg["hoes_prd"].id) : (
            each.key == "hub_2_hoes_dev" ? (oci_core_route_table.hub_lpg["hoes_dev"].id) : (
                each.key == "hub_2_hoes_qas" ? (oci_core_route_table.hub_lpg["hoes_qas"].id) : null
            )
        )
    )
}
resource "oci_core_local_peering_gateway" "lpg_spoke" {
    for_each        = var.lpg_spoke_list
    compartment_id  = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    vcn_id          = (
        length(regexall("_prd_", each.key)) > 0 ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            length(regexall("_dev_", each.key)) > 0 ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                length(regexall("_qas_", each.key)) > 0 ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name    = "lpgw_${each.key}"
}
