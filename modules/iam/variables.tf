variable tenancy_ocid   {}
variable sub_org_1_target_ocid    {}
variable sub_org_2_target_ocid    {}
variable delete_timeout {
    default = "3h"
}
variable oci_local_groups {
    type = set(string)
    default = [
        "tenancy_admins",
        "tenancy_auditors",
        "tenancy_security",
        "sub_org_1_service_admins",
        "sub_org_1_service_operator",
        "sub_org_2_service_admins",
        "sub_org_2_service_operator",                
    ] 
}
variable oci_local_groups_conf {
    type = map
    default = {
        desc_tenancy_admins     = "Group for Tenancy Admins   - cross"
        desc_tenancy_auditors   = "Group for Tenancy Auditors - cross"
        desc_tenancy_security   = "Group for Tenancy Security - cross"
        desc_sub_org_1_service_admins     = "Group for service Administrators - compartments"
        desc_sub_org_1_service_operator   = "Group for service Operators - compartments"
        desc_sub_org_2_service_admins     = "Group for service Administrators - compartments"
        desc_sub_org_2_service_operator   = "Group for service Operators - compartments"
    }
}
variable policy_config {
    type = map
    default = {
        name_tenancy_admins                 = "Tenancy_Admins"
        name_tenancy_auditors               = "Tenancy_Auditors"
        name_tenancy_security               = "Tenancy_Security"
        name_sub_org_1_service_admins       = "Sub_Org_1_Service_Admins"
        name_sub_org_1_service_operator     = "Sub_Org_1_Service_Operator"
        name_sub_org_2_service_admins       = "Sub_Org_2_Service_Admins"
        name_sub_org_2_service_operator     = "Sub_Org_2_Service_Operator"
        desc_tenancy_admins                 = "Policy for Tenancy Admins Members"
        desc_tenancy_auditors               = "Policy for Tenancy Auditors Members"
        desc_tenancy_security               = "Policy for Tenancy Security Members"
        desc_sub_org_1_service_admins       = "Policy for SubOrg 1 Service Admins Members"
        desc_sub_org_1_service_operator     = "Policy for SubOrg 1 Service Operator Members"
        desc_sub_org_2_service_admins       = "Policy for SubOrg 2 Service Admins Members"
        desc_sub_org_2_service_operator     = "Policy for SubOrg 2 Service Operator Members"
    }
}
