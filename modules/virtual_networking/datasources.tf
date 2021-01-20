data "oci_identity_compartments" "network_target_compartment" {
  compartment_id = var.tenancy_ocid
  compartment_id_in_subtree = true
  access_level              = "ANY"
  filter {
    name   = "name"
    values = ["network"]
  }
  filter {
    name = "defined_tags.operation.target_compartment"
    values = [var.compartment_network_target_filter]
  }
}
data "oci_identity_compartments" "network_target_compartment_prd" {
  compartment_id = var.tenancy_ocid
  compartment_id_in_subtree = true
  access_level              = "ANY"
  filter {
    name   = "name"
    values = ["network_prd"]
  }
}
data "oci_identity_compartments" "network_target_compartment_dev" {
  compartment_id = var.tenancy_ocid
  compartment_id_in_subtree = true
  access_level              = "ANY"
  filter {
    name   = "name"
    values = ["network_dev"]
  }
}
data "oci_identity_compartments" "network_target_compartment_qas" {
  compartment_id = var.tenancy_ocid
  compartment_id_in_subtree = true
  access_level              = "ANY"
  filter {
    name   = "name"
    values = ["network_qas"]
  }
}
data "oci_core_services" "oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}
data "oci_core_vcn_dns_resolver_association" "ns_vcn_dns_resolver_association" {
  for_each = var.spoke_vcn_list
  vcn_id = oci_core_vcn.vcns[each.key].id
}
data "oci_core_cpe_device_shapes" "all_cpe_shapes_filtred" {

}
data "oci_core_cpe_device_shape" "cpe_shape_id" {
  cpe_device_shape_id = data.oci_core_cpe_device_shapes.all_cpe_shapes_filtred.cpe_device_shapes[0].cpe_device_shape_id
}
data "oci_core_ipsec_connection_tunnels" "vpn_conn_tunnels_main" {
    ipsec_id = oci_core_ipsec.vpn_connect_main.id
}
data "oci_core_ipsec_connection_tunnels" "vpn_conn_tunnels_bkp" {
    ipsec_id = oci_core_ipsec.vpn_connect_main.id
}
