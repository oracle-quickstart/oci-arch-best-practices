resource "oci_identity_tag" "confidenciality" {
    name                = var.tags_cnf["confidenciality_name"]
    description         = var.tags_cnf["confidenciality_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["security"].id
    validator {
        validator_type  = "ENUM"
        values = [
            "CONFIDENTIAL", 
            "INTERNAL",
            "PUBLIC" ]
    }
    is_cost_tracking    = false
    is_retired          = false
    timeouts {
        delete          =  var.delete_timeout
        }
}
resource "oci_identity_tag" "compliance" {
    name                = var.tags_cnf["compliance_name"]
    description         = var.tags_cnf["compliance_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["security"].id
    validator {
        validator_type  = "ENUM"
        values = [
            "PCI",
            "27000",
            "NYST",
            "CIS"
        ]
    }
    is_cost_tracking = false
    is_retired = false
    timeouts {
        delete =  var.delete_timeout
        }
}