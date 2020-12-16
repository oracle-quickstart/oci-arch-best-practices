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
        "Allow group ${oci_identity_group.grp["tenancy_auditors"].name} to inspect call-resources in tenancy where request.user.mfaTotpVerified='true'",
    ]
}
resource "oci_identity_policy" "tenancy_security" {
    name = var.policy_config["name_tenancy_security"]
    description = var.policy_config["desc_tenancy_security"]
    compartment_id = var.tenancy_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["tenancy_security"].name} to read call-resources in tenancy where request.user.mfaTotpVerified='true'",
    ]
}
resource "oci_identity_policy" "service_admins" {
    name = var.policy_config["name_service_admins"]
    description = var.policy_config["desc_service_admins"]
    compartment_id = var.target_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage cluster-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage compute-management-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage data-catalog-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage database-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage dns in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage file-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage instance-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage object-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to use    virtual-network-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage volume-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage volume-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage api-gateway-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage approved-senders in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage suppressions in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage cloudevents-rules in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage functions-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage health-check-monitor in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage health-check-results in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage on-demand-probe in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage vantage-points in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage health-check-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage logging-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage management-dashboard-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage opsi-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage sddcs in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage serviceconnectors in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage streams in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage stream-pull in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage stream-push in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage repos in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to manage waas-family in ${var.target_ocid} where all {request.user.mfaTotpVerified='true', request.permission != /*DELETE*/ ",
    ]
}
resource "oci_identity_policy" "service_operator" {
    name = var.policy_config["name_service_operator"]
    description = var.policy_config["desc_service_operator"]
    compartment_id = var.target_ocid
    statements = [
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect cluster-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect compute-management-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect data-catalog-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect database-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect dns in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect file-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect instance-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect object-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect virtual-network-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect volume-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect volume-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect api-gateway-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect approved-senders in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect suppressions in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect cloudevents-rules in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect functions-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect health-check-monitor in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect health-check-results in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect on-demand-probe in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect vantage-points in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect health-check-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect logging-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect management-dashboard-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect opsi-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect sddcs in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect serviceconnectors in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect streams in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect stream-pull in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect stream-push in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect repos in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
        "Allow group ${oci_identity_group.grp["service_admins"].name} to inspect waas-family in ${var.target_ocid} where request.user.mfaTotpVerified='true'",
    ]
}