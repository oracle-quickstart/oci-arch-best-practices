resource "oci_identity_tag" "owner" {
    name                = var.tags_cnf["owner_name"]
    description         = var.tags_cnf["owner_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["finance"].id
    validator {
        validator_type  = "ENUM"
        values = [
            "DIVISION_ONE",
            "DIVISION_TWO"
        ]
    }
    is_cost_tracking    = false
    is_retired = false
    timeouts {
        delete          =  var.delete_timeout
        }
}
resource "oci_identity_tag" "service_active_hours" {
    name                = var.tags_cnf["service_active_hours_name"]
    description         = var.tags_cnf["service_active_hours_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["finance"].id
    validator {
        validator_type  = "ENUM"
        values = [
            "24x7",
            "12x7",
            "8x5",
            "spot"
        ]
    }
    is_cost_tracking = false
    is_retired = false
    timeouts {
        delete =  var.delete_timeout
        }
}
resource "oci_identity_tag" "project" {
    name                = var.tags_cnf["project_name"]
    description         = var.tags_cnf["project_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["finance"].id
    is_cost_tracking    = true
    is_retired          = false
    timeouts {
        delete          =  var.delete_timeout
        }
}