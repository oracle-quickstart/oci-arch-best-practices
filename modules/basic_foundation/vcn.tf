resource "oci_core_vcn" "vcns" {
    for_each        = var.vcn_list
    compartment_id  = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    display_name    = var.virtual_network_cnf["vcn_${each.key}_name"]
    cidr_block      = var.virtual_network_cnf["vcn_${each.key}_cidr"]
    dns_label       = var.virtual_network_cnf["vcn_${each.key}_dnslabel"]
}