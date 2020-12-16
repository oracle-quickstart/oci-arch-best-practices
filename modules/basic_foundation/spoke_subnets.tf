resource "oci_core_subnet" "spoke_dmz_public" {
  for_each = var.spoke_vcn_list
  compartment_id      = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
  vcn_id          = (
    each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
      each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
        each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
        )
      )
  )
  cidr_block          = var.virtual_network_cnf["${each.key}_dmz_public_cidr"]
  display_name        = var.virtual_network_cnf["${each.key}_dmz_public_dnslabel"]
  dns_label           = var.virtual_network_cnf["${each.key}_dmz_public_name"]
  dhcp_options_id     = oci_core_dhcp_options.dhcp_options[each.key].id
  prohibit_public_ip_on_vnic = false
  route_table_id      = oci_core_route_table.spoke_public[each.key].id
  security_list_ids   = [
     oci_core_security_list.sl_spoke_dmz_public[each.key].id,
  ]
}
resource "oci_core_subnet" "spoke_dmz_private" {
  for_each = var.spoke_vcn_list
  compartment_id      = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
  vcn_id          = (
    each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
      each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
        each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
        )
      )
  )
  cidr_block                  = var.virtual_network_cnf["${each.key}_dmz_private_cidr"]
  display_name                = var.virtual_network_cnf["${each.key}_dmz_private_dnslabel"]
  dns_label                   = var.virtual_network_cnf["${each.key}_dmz_private_name"]
  dhcp_options_id             = oci_core_dhcp_options.dhcp_options[each.key].id
  prohibit_public_ip_on_vnic  = true
  route_table_id              = oci_core_route_table.spoke_private[each.key].id
  security_list_ids           = [
    oci_core_security_list.sl_spoke_dmz_private[each.key].id,
  ]
}
resource "oci_core_subnet" "spoke_app" {
  for_each = var.spoke_vcn_list
  compartment_id      = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
  vcn_id          = (
    each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
      each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
        each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
        )
      )
  )
  cidr_block                  = var.virtual_network_cnf["${each.key}_app_private_cidr"]
  display_name                = var.virtual_network_cnf["${each.key}_app_private_dnslabel"]
  dns_label                   = var.virtual_network_cnf["${each.key}_app_private_name"]
  dhcp_options_id             = oci_core_dhcp_options.dhcp_options[each.key].id
  prohibit_public_ip_on_vnic  = true
  route_table_id              = oci_core_route_table.spoke_private[each.key].id
    security_list_ids         = [
       oci_core_security_list.sl_spoke_app[each.key].id,
     ]
}
resource "oci_core_subnet" "spoke_dbs" {
  for_each = var.spoke_vcn_list
  compartment_id      = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
  vcn_id          = (
    each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
      each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
        each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
        )
      )
  )
  cidr_block                  = var.virtual_network_cnf["${each.key}_dbs_private_cidr"]
  display_name                = var.virtual_network_cnf["${each.key}_dbs_private_dnslabel"]
  dns_label                   = var.virtual_network_cnf["${each.key}_dbs_private_name"]
  dhcp_options_id             = oci_core_dhcp_options.dhcp_options[each.key].id
  prohibit_public_ip_on_vnic  = true
  route_table_id              = oci_core_route_table.spoke_private[each.key].id

  security_list_ids   = [
    oci_core_security_list.sl_spoke_dbs[each.key].id,
     ]
}