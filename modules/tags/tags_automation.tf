resource "oci_identity_tag" "scheduler_action_flag" {
    name                = var.tags_cnf["scheduler_action_flag_name"]
    description         = var.tags_cnf["scheduler_action_flag_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["automation"].id
    is_cost_tracking    = false
    is_retired          = false
    timeouts {
        delete          =  var.delete_timeout
        }
}
resource "oci_identity_tag" "deprovision_action_date" {
    name                = var.tags_cnf["deprovision_action_date_name"]
    description         = var.tags_cnf["deprovision_action_date_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["automation"].id
    is_cost_tracking    = false
    is_retired          = false
    timeouts {
        delete          =  var.delete_timeout
        }
}

