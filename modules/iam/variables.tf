variable tenancy_ocid   {}
variable target_ocid    {}
variable delete_timeout {}
variable oci_local_groups {
    type = set(string)
    default = [
        "tenancy_admins",
        "tenancy_auditors",
        "tenancy_security",
        "service_admins",
        "service_operator",        
    ] 
}
variable oci_local_groups_conf {
    type = map
    default = {
        desc_tenancy_admins     = "Group for Tenancy Admins   - cross"
        desc_tenancy_auditors   = "Group for Tenancy Auditors - cross"
        desc_tenancy_security   = "Group for Tenancy Security - cross"
        desc_service_admins     = "Group for service Administrators - compartments"
        desc_service_operator   = "Group for service Operators - compartments"
    }
}
variable policy_config {
    type = map
    default = {
        name_tenancy_admins      = "Tenancy_Admins"
        name_tenancy_auditors    = "Tenancy_Auditors"
        name_tenancy_security    = "Tenancy_Security"
        name_service_admins      = "Service_Admins"
        name_service_operator    = "Service_Operator"
        desc_tenancy_admins      = "Policy for Tenancy Admins Members"
        desc_tenancy_auditors    = "Policy for Tenancy Auditors Members"
        desc_tenancy_security    = "Policy for Tenancy Security Members"
        desc_service_admins      = "Policy for Service Admins Members"
        desc_service_operator    = "Policy for Service Operator Members"
    }
}
