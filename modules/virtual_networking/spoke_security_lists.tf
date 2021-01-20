resource "oci_core_security_list" "sl_spoke_dmz_public" {
    for_each                = var.vcn_spoke_subnets
    compartment_id = (
        each.key == "hub" ? (lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")) : (
            each.key == "hoes_prd" ? (lookup(data.oci_identity_compartments.network_target_compartment_prd.compartments[0],"id")) : (
                each.key == "hoes_dev" ? (lookup(data.oci_identity_compartments.network_target_compartment_dev.compartments[0],"id")) : (
                    each.key == "hoes_qas" ? (lookup(data.oci_identity_compartments.network_target_compartment_qas.compartments[0],"id")) : null
                    )
                )
           )
        )
    vcn_id          = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name = "sl_dmz_public_${each.key}"
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "6"
        description = "Egress SVC Rule Allow - TCP All Outbound"
        destination_type = "CIDR_BLOCK"
    }
    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        stateless = false
        description = "Allow HTTPS - Inbound"
    tcp_options {
      min = 443
      max = 443
    }
  }
}
resource "oci_core_security_list" "sl_spoke_dmz_private" {
    for_each                = var.vcn_spoke_subnets
    compartment_id = (
        each.key == "hub" ? (lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")) : (
            each.key == "hoes_prd" ? (lookup(data.oci_identity_compartments.network_target_compartment_prd.compartments[0],"id")) : (
                each.key == "hoes_dev" ? (lookup(data.oci_identity_compartments.network_target_compartment_dev.compartments[0],"id")) : (
                    each.key == "hoes_qas" ? (lookup(data.oci_identity_compartments.network_target_compartment_qas.compartments[0],"id")) : null
                    )
                )
           )
        )
    vcn_id          = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name = "sl_dmz_pivate_${each.key}"
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "6"
        description = "Egress SVC Rule Allow - TCP All Outbound"
        destination_type = "CIDR_BLOCK"
    }
    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        stateless = false
        description = "Allow HTTPS - Inbound"
    tcp_options {
      min = 443
      max = 443
    }
  }
}
resource "oci_core_security_list" "sl_spoke_app" {
    for_each                = var.vcn_spoke_subnets
    compartment_id = (
        each.key == "hub" ? (lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")) : (
            each.key == "hoes_prd" ? (lookup(data.oci_identity_compartments.network_target_compartment_prd.compartments[0],"id")) : (
                each.key == "hoes_dev" ? (lookup(data.oci_identity_compartments.network_target_compartment_dev.compartments[0],"id")) : (
                    each.key == "hoes_qas" ? (lookup(data.oci_identity_compartments.network_target_compartment_qas.compartments[0],"id")) : null
                    )
                )
           )
        )
    vcn_id          = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name = "sl_app_${each.key}"
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "6"
        description = "Egress SVC Rule Allow - TCP All Outbound"
        destination_type = "CIDR_BLOCK"
    }
    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        stateless = false
        description = "Allow HTTPS - Inbound"
    tcp_options {
      min = 443
      max = 443
    }
  }
}
resource "oci_core_security_list" "sl_spoke_dbs" {
    for_each                = var.vcn_spoke_subnets
    compartment_id = (
        each.key == "hub" ? (lookup(data.oci_identity_compartments.network_target_compartment.compartments[0],"id")) : (
            each.key == "hoes_prd" ? (lookup(data.oci_identity_compartments.network_target_compartment_prd.compartments[0],"id")) : (
                each.key == "hoes_dev" ? (lookup(data.oci_identity_compartments.network_target_compartment_dev.compartments[0],"id")) : (
                    each.key == "hoes_qas" ? (lookup(data.oci_identity_compartments.network_target_compartment_qas.compartments[0],"id")) : null
                    )
                )
           )
        )
    vcn_id                  = (
        each.key == "hoes_prd" ? (oci_core_vcn.vcns["hoes_prd"].id) : (
            each.key == "hoes_dev" ? (oci_core_vcn.vcns["hoes_dev"].id) : (
                each.key == "hoes_qas" ? (oci_core_vcn.vcns["hoes_qas"].id) : null
            )
        )
    )
    display_name            = "sl_dbs_${each.key}"
    egress_security_rules {
        destination         = "0.0.0.0/0"
        protocol            = "6"
        description         = "Egress SVC Rule Allow - TCP All Outbound"
        destination_type    = "CIDR_BLOCK"
    }
    ingress_security_rules {
        protocol            = "6"
        source              = "0.0.0.0/0"
        stateless           = false
        description = "Allow HTTPS - Inbound"
    tcp_options {
      min                   = 443
      max                   = 443
    }
  }
}