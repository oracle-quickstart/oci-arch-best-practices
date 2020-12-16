resource "oci_dns_resolver_endpoint" "ns_resolver_endpoint_forward" {
    for_each = var.spoke_vcn_list
    endpoint_type = "VNIC"
    forwarding_address = var.external_dns_cnf["dns_server_address"]
    is_forwarding = "true"
    is_listening = "false"
    name = "forward_${each.key}_dns"
    resolver_id = oci_dns_resolver.ns_resolver[each.key].id
    scope = "PRIVATE"
    subnet_id = oci_core_subnet.spoke_dmz_private[each.key].id
}
resource "oci_dns_resolver_endpoint" "ns_resolver_endpoint_listen" {
    for_each = var.spoke_vcn_list
    endpoint_type = "VNIC"
    nsg_ids = [(
        each.key == "hoes_prd" ? (oci_core_network_security_group.network_security_group["hoes_prd_dns_private"].id) : (
            each.key == "hoes_dev" ? (oci_core_network_security_group.network_security_group["hoes_dev_dns_private"].id) : (
                each.key == "hoes_qas" ? (oci_core_network_security_group.network_security_group["hoes_qas_dns_private"].id) : null
            )
        )
    ),]
    is_forwarding = false
    is_listening = true
    name = "listen_${each.key}_dns"
    resolver_id = oci_dns_resolver.ns_resolver[each.key].id
    scope = "PRIVATE"
    subnet_id = oci_core_subnet.spoke_dmz_private[each.key].id
}