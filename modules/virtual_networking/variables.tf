variable tenancy_ocid   {}
variable "on_primeses_summary_cidr" {
    default = "10.0.0.0/8"
}
variable external_dns_cnf {
    type = map
    default = {
        dns_private_zone_1 = "internal.ok"
        dns_server_address = "10.0.0.248"
    }
}
variable dynamic_router_gw_list {
    type = set(string)
    default = [
        "drg_main",
    ]
}
variable cpe_list {
  type = set(string)
  default =  [
      "main",
  ]
}
variable cpe_cnf {
    type = map
    default = {
        main_cpe_identifier = "my_corp_main"
        main_cpe_ipaddr     = "192.10.10.2"
    }
}
variable vcn_list {
    type = set(string)
    default = [
        "hub",
        "hoes_prd",
        "hoes_dev",
        "hoes_qas",
    ]
}
variable vcn_spoke_subnets {
    type = set(string)
    default = [
        "hoes_prd",
        "hoes_dev",
        "hoes_qas",
    ]
}
variable "compartment_network_target_filter" {
    default = "network_resources_target"
}
variable virtual_network_cnf {
    type = map
    default = {
        vcn_hub_name                    = "transit"
        vcn_hub_cidr                    = "192.168.255.0/25"
        vcn_hub_dnslabel                = "tx"
        //Spoke VCNS definition
        vcn_hoes_prd_name               = "hoes_prd"
        vcn_hoes_prd_cidr               = "172.31.232.0/21"
        vcn_hoes_prd_dnslabel           = "prd"
        vcn_hoes_dev_name               = "hoes_dev"
        vcn_hoes_dev_cidr               = "172.31.240.0/21"
        vcn_hoes_dev_dnslabel           = "dev"
        vcn_hoes_qas_name               = "hoes_qas"
        vcn_hoes_qas_cidr               = "172.31.248.0/21"
        vcn_hoes_qas_dnslabel           = "qas"
        //Subnet definition
        hoes_prd_dmz_public_cidr        = "172.31.232.0/24"
        hoes_dev_dmz_public_cidr        = "172.31.240.0/24"
        hoes_qas_dmz_public_cidr        = "172.31.248.0/24"
        hoes_prd_dmz_public_name        = "hoes_prd_dmz_public"
        hoes_dev_dmz_public_name        = "hoes_dev_dmz_public"
        hoes_qas_dmz_public_name        = "hoes_qas_dmz_public"
        hoes_prd_dmz_public_dnslabel    = "prdpub"
        hoes_dev_dmz_public_dnslabel    = "devpub"
        hoes_qas_dmz_public_dnslabel    = "qaspub"

        hoes_prd_dmz_private_cidr        = "172.31.233.0/24"
        hoes_dev_dmz_private_cidr        = "172.31.241.0/24"
        hoes_qas_dmz_private_cidr        = "172.31.249.0/24"
        hoes_prd_dmz_private_name        = "hoes_prd_dmz_private"
        hoes_dev_dmz_private_name        = "hoes_dev_dmz_private"
        hoes_qas_dmz_private_name        = "hoes_qas_dmz_private"
        hoes_prd_dmz_private_dnslabel    = "prddmzpri"
        hoes_dev_dmz_private_dnslabel    = "devdmzpri"
        hoes_qas_dmz_private_dnslabel    = "qasdmzpri"

        hoes_prd_app_private_cidr        = "172.31.234.0/24"
        hoes_dev_app_private_cidr        = "172.31.242.0/24"
        hoes_qas_app_private_cidr        = "172.31.250.0/24"
        hoes_prd_app_private_name        = "hoes_prd_app_private"
        hoes_dev_app_private_name        = "hoes_dev_app_private"
        hoes_qas_app_private_name        = "hoes_qas_app_private"
        hoes_prd_app_private_dnslabel    = "prdapppri"
        hoes_dev_app_private_dnslabel    = "devapppri"
        hoes_qas_app_private_dnslabel    = "qasapppri"

        hoes_prd_dbs_private_cidr        = "172.31.235.0/24"
        hoes_dev_dbs_private_cidr        = "172.31.243.0/24"
        hoes_qas_dbs_private_cidr        = "172.31.251.0/24"
        hoes_prd_dbs_private_name        = "hoes_prd_dbs_private"
        hoes_dev_dbs_private_name        = "hoes_dev_dbs_private"
        hoes_qas_dbs_private_name        = "hoes_qas_dbs_private"
        hoes_prd_dbs_private_dnslabel    = "prddbspri"
        hoes_dev_dbs_private_dnslabel    = "devdbspri"
        hoes_qas_dbs_private_dnslabel    = "qasdbspri"
    }
}
variable spoke_vcn_list {
    type = set(string)
    default = [
        "hoes_prd",
        "hoes_dev",
        "hoes_qas",
    ]
}
variable lpg_hub_list {
    type = set(string)
    default = [
        "hub_2_hoes_prd",
        "hub_2_hoes_dev",
        "hub_2_hoes_qas"
    ]
}
variable lpg_spoke_list {
    type = set(string)
    default = [
        "hoes_prd_2_hub",
        "hoes_dev_2_hub",
        "hoes_qas_2_hub"
    ]
}
variable network_security_group_list {
    type = set(string)
    default = [
        "hoes_prd_dmz_public",
        "hoes_prd_dmz_private",
        "hoes_prd_app_private",
        "hoes_prd_dbs_private",
        "hoes_prd_dns_private",

        "hoes_dev_dmz_public",
        "hoes_dev_dmz_private",
        "hoes_dev_app_private",
        "hoes_dev_dbs_private",
        "hoes_dev_dns_private",

        "hoes_qas_dmz_public",
        "hoes_qas_dmz_private",
        "hoes_qas_app_private",
        "hoes_qas_dbs_private",
        "hoes_qas_dns_private",
    ]
}
variable vpn_connect_bgp_cnf {
    type = map
    default = {
        customer_bgp_asn            = "65369"

        main_customer_interface_ip  = "192.168.1.221/30"
        main_oracle_interface_ip    = "192.168.1.222/30"
        bkp_customer_interface_ip   = "192.168.1.197/30"
        bkp_oracle_interface_ip     = "192.168.1.198/30"
        
    }   
  
}