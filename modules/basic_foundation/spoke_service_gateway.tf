resource "oci_core_service_gateway" "transitive_svc_gateway" {
    for_each            = var.spoke_vcn_list
    compartment_id      = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    vcn_id          = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    services {
        service_id      = data.oci_core_services.oci_services.services.0.id
    }
    display_name        =  "service_gateway_${each.key}"
    route_table_id      = oci_core_route_table.service_gw[each.key].id
}
