/*
Cloud deployments will require the be adhenrence with governance
Here an sample build the an regular form to allow to teams that manage the tenancy 
or service with propper rule to execute the common tasks.
*/

resource "oci_identity_policy" "tenancy_admins" {
    name = var.policy_config["name_tenancy_admins"]
    description = var.policy_config["desc_tenancy_admins"]
    compartment_id = var.tenancy_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage cluster-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage compute-management-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage data-catalog-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage database-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage dns in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage file-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage instance-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage object-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage virtual-network-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage volume-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage volume-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage api-gateway-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage approved-senders in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage suppressions in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage cloudevents-rules in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage functions-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage health-check-monitor in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage health-check-results in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage on-demand-probe in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage vantage-points in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage health-check-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage logging-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage management-dashboard-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage opsi-family in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage sddcs in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage serviceconnectors in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage streams in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage stream-pull in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage stream-push in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage repos in tenancy where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["tenancy_admins"].name} to manage waas-family in tenancy where request.user.mfaTotpVerified='true'",
    ]
}
resource "oci_identity_policy" "tenancy_auditors" {
    name = var.policy_config["name_tenancy_auditors"]
    description = var.policy_config["desc_tenancy_auditors"]
    compartment_id = var.tenancy_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["tenancy_auditors"].name} to inspect all-resources in tenancy where request.user.mfaTotpVerified='true'",
    ]
}
resource "oci_identity_policy" "tenancy_security" {
    name = var.policy_config["name_tenancy_security"]
    description = var.policy_config["desc_tenancy_security"]
    compartment_id = var.tenancy_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["tenancy_security"].name} to read all-resources in tenancy where request.user.mfaTotpVerified='true'",
    ]
}
resource "oci_identity_policy" "sub_org_1_service_admins" {
    name = var.policy_config["name_sub_org_1_service_admins"]
    description = var.policy_config["desc_sub_org_1_service_admins"]
    compartment_id = var.tenancy_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage cluster-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage cluster-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage compute-management-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage data-catalog-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage database-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage dns in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage file-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage instance-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage object-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to use    virtual-network-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage volume-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage volume-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage api-gateway-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage approved-senders in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage suppressions in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage cloudevents-rules in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage functions-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage health-check-monitor in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage health-check-results in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage on-demand-probe in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage vantage-points in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage health-check-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage logging-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage management-dashboard-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage opsi-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage sddcs in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage serviceconnectors in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage streams in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage stream-pull in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage stream-push in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage repos in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_admins"].name} to manage waas-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        
    ]
}
resource "oci_identity_policy" "sub_org_1_service_operator" {
    name = var.policy_config["name_sub_org_1_service_operator"]
    description = var.policy_config["desc_sub_org_1_service_operator"]
    compartment_id = var.tenancy_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect cluster-family in compartment id             ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect cluster-family in compartment id             ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect compute-management-family in compartment id  ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect data-catalog-family in compartment id        ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect database-family in compartment id            ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect dns in compartment id                        ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect file-family in compartment id                ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect instance-family in compartment id            ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect object-family in compartment id              ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect    virtual-network-family in compartment id  ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect volume-family in compartment id              ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect volume-family in compartment id              ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect api-gateway-family in compartment id         ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect approved-senders in compartment id           ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect suppressions in compartment id               ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect cloudevents-rules in compartment id          ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect functions-family in compartment id           ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect health-check-monitor in compartment id       ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect health-check-results in compartment id       ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to manage  on-demand-probe in compartment id            ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect vantage-points in compartment id             ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect health-check-family in compartment id        ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect logging-family in compartment id             ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect management-dashboard-family in compartment id ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect opsi-family in compartment id                ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect sddcs in compartment id                      ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect serviceconnectors in compartment id          ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect streams in compartment id                    ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to read  stream-pull in compartment id                  ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to read  stream-push in compartment id                  ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect repos in compartment id                      ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_1_service_operator"].name} to inspect waas-family in compartment id                ${var.sub_org_1_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",

    ]
}

//
resource "oci_identity_policy" "sub_org_2_service_admins" {
    name = var.policy_config["name_sub_org_2_service_admins"]
    description = var.policy_config["desc_sub_org_2_service_admins"]
    compartment_id = var.tenancy_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage cluster-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage cluster-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage compute-management-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage data-catalog-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage database-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage dns in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage file-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage instance-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage object-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to use    virtual-network-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage volume-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage volume-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage api-gateway-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage approved-senders in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage suppressions in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage cloudevents-rules in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage functions-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage health-check-monitor in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage health-check-results in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage on-demand-probe in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage vantage-points in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage health-check-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage logging-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage management-dashboard-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage opsi-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage sddcs in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage serviceconnectors in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage streams in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage stream-pull in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage stream-push in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage repos in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_admins"].name} to manage waas-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        
    ]
}
resource "oci_identity_policy" "sub_org_2_service_operator" {
    name = var.policy_config["name_sub_org_2_service_operator"]
    description = var.policy_config["desc_sub_org_2_service_operator"]
    compartment_id = var.tenancy_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect cluster-family in compartment id             ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect cluster-family in compartment id             ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect compute-management-family in compartment id  ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect data-catalog-family in compartment id        ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect database-family in compartment id            ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect dns in compartment id                        ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect file-family in compartment id                ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect instance-family in compartment id            ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect object-family in compartment id              ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect    virtual-network-family in compartment id  ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect volume-family in compartment id              ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect volume-family in compartment id              ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect api-gateway-family in compartment id         ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect approved-senders in compartment id           ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect suppressions in compartment id               ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect cloudevents-rules in compartment id          ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect functions-family in compartment id           ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect health-check-monitor in compartment id       ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect health-check-results in compartment id       ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to manage  on-demand-probe in compartment id            ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect vantage-points in compartment id             ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect health-check-family in compartment id        ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect logging-family in compartment id             ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect management-dashboard-family in compartment id ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect opsi-family in compartment id                ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect sddcs in compartment id                      ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect serviceconnectors in compartment id          ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect streams in compartment id                    ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to read  stream-pull in compartment id                  ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to read  stream-push in compartment id                  ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect repos in compartment id                      ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",
        "Allow group ${oci_identity_group.grp["sub_org_2_service_operator"].name} to inspect waas-family in compartment id                ${var.sub_org_2_target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ }",

    ]
}