resource "oci_core_network_security_group" "network_security_group" {
    for_each = var.network_security_group_list
    compartment_id = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    vcn_id          = (
        length(regexall("_prd_", each.key)) > 0 ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            length(regexall("_dev_", each.key)) > 0 ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                length(regexall("_qas_", each.key)) > 0 ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name = "nsg_${each.key}"
}
