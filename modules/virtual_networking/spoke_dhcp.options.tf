resource "oci_core_dhcp_options" "dhcp_options" {
    for_each = var.spoke_vcn_list
    compartment_id      = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    vcn_id          = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }
    options {
        type = "SearchDomain"
        search_domain_names = [ "oraclevcn.com" ]
    }
    display_name = "dbcp_options_${each.key}"
}
