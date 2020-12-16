resource "oci_core_cpe" "cpe" {
    for_each            = var.cpe_list
    compartment_id      = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    ip_address          = var.cpe_cnf["${each.key}_cpe_ipaddr"]
    display_name        = var.cpe_cnf["${each.key}_cpe_identifier"]
    cpe_device_shape_id = data.oci_core_cpe_device_shape.cpe_shape_id.id
}
