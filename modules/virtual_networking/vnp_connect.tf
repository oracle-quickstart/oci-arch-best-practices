resource "oci_core_ipsec" "vpn_connect_main" {
    compartment_id      = lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")
    cpe_id              = oci_core_cpe.cpe["main"].id
    drg_id              = oci_core_drg.drg["drg_main"].id
    static_routes       = [var.on_primeses_summary_cidr,]
    display_name        = "VPNConnect - 1"
}
resource "oci_core_ipsec_connection_tunnel_management" "ipsec_connection_tunnel_management_main_1" {
    ipsec_id            = oci_core_ipsec.vpn_connect_main.id
    tunnel_id           = lookup(data.oci_core_ipsec_connection_tunnels.vpn_conn_tunnels_main.ip_sec_connection_tunnels[0],"id")
    bgp_session_info {
        customer_bgp_asn      = var.vpn_connect_bgp_cnf["customer_bgp_asn"]
        customer_interface_ip = var.vpn_connect_bgp_cnf["main_customer_interface_ip"]
        oracle_interface_ip   = var.vpn_connect_bgp_cnf["main_oracle_interface_ip"]
    }
    display_name  = "IPSecTunnelPrimary"
    routing       = "BGP"
    #shared_secret = "sharedSecret" #Commented to increase security OCI will generate and the person who has access can access the value.
    ike_version   = "V2"
}
#Commented due single tunnel deployed per CPE model
resource "oci_core_ipsec_connection_tunnel_management" "ipsec_connection_tunnel_management_main_2" {
    ipsec_id            = oci_core_ipsec.vpn_connect_main.id
    tunnel_id           = lookup(data.oci_core_ipsec_connection_tunnels.vpn_conn_tunnels_bkp.ip_sec_connection_tunnels[1],"id")
    bgp_session_info {
        customer_bgp_asn      = var.vpn_connect_bgp_cnf["customer_bgp_asn"]
        customer_interface_ip = var.vpn_connect_bgp_cnf["bkp_customer_interface_ip"]
        oracle_interface_ip   = var.vpn_connect_bgp_cnf["bkp_oracle_interface_ip"]
    }
    display_name  = "IPSecTunnelBackup"
    routing       = "BGP"
    #shared_secret = "sharedSecret" #Commented to increase security OCI will generate and the person who has access can access the value.
    ike_version   = "V1"
}

