resource "oci_core_subnet" "spoke_dmz_public" {
  for_each = var.vcn_spoke_subnets
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
  cidr_block          = var.virtual_network_cnf["${each.key}_dmz_public_cidr"]
  display_name        = var.virtual_network_cnf["${each.key}_dmz_public_name"]
  dns_label           = var.virtual_network_cnf["${each.key}_dmz_public_dnslabel"]
  dhcp_options_id     = oci_core_dhcp_options.dhcp_options[each.key].id
  prohibit_public_ip_on_vnic = false
  route_table_id      = oci_core_route_table.spoke_public[each.key].id
  security_list_ids   = [
     oci_core_security_list.sl_spoke_dmz_public[each.key].id,
  ]
}
resource "oci_core_subnet" "spoke_dmz_private" {
  for_each = var.vcn_spoke_subnets
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
  cidr_block                  = var.virtual_network_cnf["${each.key}_dmz_private_cidr"]
  display_name                = var.virtual_network_cnf["${each.key}_dmz_private_name"]
  dns_label                   = var.virtual_network_cnf["${each.key}_dmz_private_dnslabel"]
  dhcp_options_id             = oci_core_dhcp_options.dhcp_options[each.key].id
  prohibit_public_ip_on_vnic  = true
  route_table_id              = oci_core_route_table.spoke_private[each.key].id
  security_list_ids           = [
    oci_core_security_list.sl_spoke_dmz_private[each.key].id,
  ]
}
resource "oci_core_subnet" "spoke_app" {
  for_each = var.vcn_spoke_subnets
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
  cidr_block                  = var.virtual_network_cnf["${each.key}_app_private_cidr"]
  display_name                = var.virtual_network_cnf["${each.key}_app_private_name"]
  dns_label                   = var.virtual_network_cnf["${each.key}_app_private_dnslabel"]
  dhcp_options_id             = oci_core_dhcp_options.dhcp_options[each.key].id
  prohibit_public_ip_on_vnic  = true
  route_table_id              = oci_core_route_table.spoke_private[each.key].id
    security_list_ids         = [
       oci_core_security_list.sl_spoke_app[each.key].id,
     ]
}
resource "oci_core_subnet" "spoke_dbs" {
  for_each = var.vcn_spoke_subnets
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
  cidr_block                  = var.virtual_network_cnf["${each.key}_dbs_private_cidr"]
  display_name                = var.virtual_network_cnf["${each.key}_dbs_private_name"]
  dns_label                   = var.virtual_network_cnf["${each.key}_dbs_private_dnslabel"]
  dhcp_options_id             = oci_core_dhcp_options.dhcp_options[each.key].id
  prohibit_public_ip_on_vnic  = true
  route_table_id              = oci_core_route_table.spoke_private[each.key].id

  security_list_ids   = [
    oci_core_security_list.sl_spoke_dbs[each.key].id,
     ]
}