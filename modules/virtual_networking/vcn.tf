resource "oci_core_vcn" "vcns" {
    for_each        = var.vcn_list
    compartment_id = (
        each.key == "hub" ? (lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")) : (
            each.key == "hoes_prd" ? (lookup(data.oci_identity_compartments.network_target_compartment_prd.compartments[0],"id")) : (
                each.key == "hoes_dev" ? (lookup(data.oci_identity_compartments.network_target_compartment_dev.compartments[0],"id")) : (
                    each.key == "hoes_qas" ? (lookup(data.oci_identity_compartments.network_target_compartment_qas.compartments[0],"id")) : null
                    )
                )
           )
        )
    display_name    = var.virtual_network_cnf["vcn_${each.key}_name"]
    cidr_block      = var.virtual_network_cnf["vcn_${each.key}_cidr"]
    dns_label       = var.virtual_network_cnf["vcn_${each.key}_dnslabel"]
}