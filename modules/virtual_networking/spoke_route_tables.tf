resource "oci_core_route_table" "spoke_public" {
    for_each                = var.vcn_spoke_subnets
    compartment_id = (
        each.key == "hub" ? (lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")) : (
            each.key == "hoes_prd" ? (lookup(data.oci_identity_compartments.network_target_compartment_prd.compartments[0],"id")) : (
                each.key == "hoes_dev" ? (lookup(data.oci_identity_compartments.network_target_compartment_dev.compartments[0],"id")) : (
                    each.key == "hoes_qas" ? (lookup(data.oci_identity_compartments.network_target_compartment_qas.compartments[0],"id")) : null
                    )
                )
           )
        )
    vcn_id          = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name            = "rt_${each.key}_public"
    route_rules {
        description         = "On Primeses + All External Route Summary"
        destination         = var.on_primeses_summary_cidr
        destination_type    = "CIDR_BLOCK"
        network_entity_id   = (
            each.key == "hoes_prd" ? (oci_core_internet_gateway.spoke_igw["hoes_prd"].id) : (
                each.key == "hoes_dev" ? (oci_core_internet_gateway.spoke_igw["hoes_dev"].id) : (
                    each.key == "hoes_qas" ? (oci_core_internet_gateway.spoke_igw["hoes_qas"].id) : null
            )
        )
        )
    }
}
resource "oci_core_route_table" "spoke_private" {
    for_each                = var.vcn_spoke_subnets
    //compartment_id          = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    compartment_id = (
        each.key == "hub" ? (lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")) : (
            each.key == "hoes_prd" ? (lookup(data.oci_identity_compartments.network_target_compartment_prd.compartments[0],"id")) : (
                each.key == "hoes_dev" ? (lookup(data.oci_identity_compartments.network_target_compartment_dev.compartments[0],"id")) : (
                    each.key == "hoes_qas" ? (lookup(data.oci_identity_compartments.network_target_compartment_qas.compartments[0],"id")) : null
                    )
                )
           )
        )


    vcn_id          = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name            = "rt_${each.key}_private"
    
    route_rules {
        destination       = lookup(data.oci_core_services.oci_services.services[0], "cidr_block")
        destination_type  = "SERVICE_CIDR_BLOCK"
        network_entity_id = (
            each.key == "hoes_prd" ? (oci_core_service_gateway.transitive_svc_gateway["hoes_prd"].id) : (
                each.key == "hoes_dev" ? (oci_core_service_gateway.transitive_svc_gateway["hoes_dev"].id) : (
                    each.key == "hoes_qas" ? (oci_core_service_gateway.transitive_svc_gateway["hoes_qas"].id) : null
            )
        )
    )
    }

    route_rules {
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
   /*     network_entity_id = (
        length(regexall("_prd_", each.key)) > 0 ? (oci_core_local_peering_gateway.lpg_spoke["hoes_prd"].id) : (
            length(regexall("_dev_", each.key)) > 0 ? (oci_core_local_peering_gateway.lpg_spoke["hoes_dev"].id) : (
                length(regexall("_qas_", each.key)) > 0 ? (oci_core_local_peering_gateway.lpg_spoke["hoes_qas"].id) : null
            )
        )
    )
    */
        network_entity_id = (
            each.key == "hoes_prd" ? (oci_core_local_peering_gateway.lpg_spoke["${each.key}_2_hub"].id) : ( 
                each.key == "hoes_dev" ? (oci_core_local_peering_gateway.lpg_spoke["${each.key}_2_hub"].id) : (
                    each.key == "hoes_qas" ? (oci_core_local_peering_gateway.lpg_spoke["${each.key}_2_hub"].id) : null
                )
            )
        )
    }


}
resource "oci_core_route_table" "service_gw" {
    for_each                = var.vcn_spoke_subnets
    compartment_id = (
        each.key == "hub" ? (lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")) : (
            each.key == "hoes_prd" ? (lookup(data.oci_identity_compartments.network_target_compartment_prd.compartments[0],"id")) : (
                each.key == "hoes_dev" ? (lookup(data.oci_identity_compartments.network_target_compartment_dev.compartments[0],"id")) : (
                    each.key == "hoes_qas" ? (lookup(data.oci_identity_compartments.network_target_compartment_qas.compartments[0],"id")) : null
                    )
                )
           )
        )

    vcn_id          = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name            = "rt_${each.key}_svcgw"
}