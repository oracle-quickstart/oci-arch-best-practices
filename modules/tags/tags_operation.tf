resource "oci_identity_tag" "target_compartment" {
    name         = var.tags_cnf["target_compartment_name"]
    description                = var.tags_cnf["target_compartment_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["operation"].id
    is_cost_tracking    = false
    is_retired          = false
    timeouts {
        delete          =  var.delete_timeout
        }
}
resource "oci_identity_tag" "application_name" {
    name         = var.tags_cnf["application_name_name"]
    description                = var.tags_cnf["application_name_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["operation"].id
    is_cost_tracking    = false
    is_retired          = false
    timeouts {
        delete          =  var.delete_timeout
        }
}
resource "oci_identity_tag" "application_id" {
    name         = var.tags_cnf["application_id_name"]
    description                = var.tags_cnf["application_id_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["operation"].id
    is_cost_tracking    = false
    is_retired          = false
    timeouts {
        delete          =  var.delete_timeout
        }
}
resource "oci_identity_tag" "resource_layer" {
    name                = var.tags_cnf["resource_layer_name"]
    description         = var.tags_cnf["resource_layer_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["operation"].id
    validator {
        validator_type  = "ENUM"
        values = [
            "DMZ",
            "APP",
            "DB"
        ]
    }
    is_cost_tracking    = false
    is_retired = false
    timeouts {
        delete          =  var.delete_timeout
        }
}
resource "oci_identity_tag" "app_deployment_model" {
    name                = var.tags_cnf["app_deployment_model_name"]
    description         = var.tags_cnf["app_deployment_model_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["operation"].id
    validator {
        validator_type  = "ENUM"
        values = [
            "monolitic",
            "scale-out",
            "scale-up",
            "os_cluster",
            "service_cluster"
        ]
    }
    is_cost_tracking    = false
    is_retired = false
    timeouts {
        delete          =  var.delete_timeout
        }
}
resource "oci_identity_tag" "environment" {
    name                = var.tags_cnf["environment_name"]
    description         = var.tags_cnf["environment_description"]
    tag_namespace_id    = oci_identity_tag_namespace.namespaces["operation"].id
    validator {
        validator_type  = "ENUM"
        values = [
            "PRD",
            "DEV",
            "QAS"
        ]
    }
    is_cost_tracking    = false
    is_retired = false
    timeouts {
        delete          =  var.delete_timeout
        }
}