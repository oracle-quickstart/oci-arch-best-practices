resource "oci_dns_resolver" "ns_resolver" {
    for_each = var.spoke_vcn_list
    display_name = each.key
    resolver_id = data.oci_core_vcn_dns_resolver_association.ns_vcn_dns_resolver_association[each.key].dns_resolver_id
    scope = "PRIVATE"

    //rules {
    //    action = "FORWARD"
    //    client_address_conditions = []
    //    destination_addresses =  [var.external_dns_cnf["dns_server_address"],]
    //    qname_cover_conditions = [var.external_dns_cnf["dns_private_zone_1"],]
    //    source_endpoint_name = each.key
    //}
}