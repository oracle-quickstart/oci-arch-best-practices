resource "oci_core_internet_gateway" "spoke_igw" {
    for_each                = var.spoke_vcn_list
    compartment_id          = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    vcn_id          = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name = "igw_${each.key}"
}
