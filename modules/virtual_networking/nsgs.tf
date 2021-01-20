resource "oci_core_network_security_group" "network_security_group" {
    for_each = var.network_security_group_list
    compartment_id = (
            length(regexall("_prd_", each.key)) > 0 ? (lookup(data.oci_identity_compartments.network_target_compartment_prd.compartments[0],"id")) : (
                length(regexall("_dev_", each.key)) > 0 ? (lookup(data.oci_identity_compartments.network_target_compartment_dev.compartments[0],"id")) : (
                    length(regexall("_qas_", each.key)) > 0 ? (lookup(data.oci_identity_compartments.network_target_compartment_qas.compartments[0],"id")) : null
                    )
                )
           )
    vcn_id          = (
        length(regexall("_prd_", each.key)) > 0 ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            length(regexall("_dev_", each.key)) > 0 ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                length(regexall("_qas_", each.key)) > 0 ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name = "nsg_${each.key}"
}
