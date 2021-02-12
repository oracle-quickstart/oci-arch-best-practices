/*
Here we will handle security  posture observation with Cloud Guard.
Three major components will be used in this plan:
- Detector 
- Responder
- Target
the main portion will reside the tenanycy wide configuration. And an second if 
the struture defined for compartmenrts handles departments or chield organzations will be defined at second block of code
If you use a multi regional deployment configure the variable the request for cloud guard dconfiguration
 must match the reporting region.
*/

// Setup Cloud Guard configuration
resource "oci_cloud_guard_cloud_guard_configuration" "cloud_guard_configuration" {
    for_each            = var.deployment_regions
    compartment_id      = var.tenancy_ocid
    reporting_region    = each.key
    status              = var.cloud_guard_configuration_status
}

// First Tenancy wide.
resource oci_cloud_guard_detector_recipe detector_recipe {
    for_each = var.compartments_to_monitor
    compartment_id = (
        each.key == "root_compartment" ? (var.tenancy_ocid  ) : (
            each.key == "SubOrg1" ? (lookup(data.oci_identity_compartments.sub_org1.compartments[0],"id")) : (
                each.key == "SubOrg2" ? (lookup(data.oci_identity_compartments.sub_org2.compartments[0],"id")) : null)
        )
    )
    display_name = "${each.key}_CLOUD_GUARD_DETECTOR_recipe"
    source_detector_recipe_id = (data.oci_cloud_guard_detector_recipes.oci_original_detector.detector_recipe_collection.0.items.0.id)

}

resource oci_cloud_guard_responder_recipe responder_recipe {
    for_each = var.compartments_to_monitor
    compartment_id = (
        each.key == "root_compartment" ? (var.tenancy_ocid  ) : (
            each.key == "SubOrg1" ? (lookup(data.oci_identity_compartments.sub_org1.compartments[0],"id")) : (
                each.key == "SubOrg2" ? (lookup(data.oci_identity_compartments.sub_org2.compartments[0],"id")) : null)
        )
    )
    display_name = "${each.key}_CLOUD_GUARD_RESPONDER_recipe"
    source_responder_recipe_id = (data.oci_cloud_guard_responder_recipes.oci_original_responder.responder_recipe_collection.0.items.0.id)
     
}

resource oci_cloud_guard_target organization_target {
    for_each = var.compartments_to_monitor
    compartment_id = (
        each.key == "root_compartment" ? (var.tenancy_ocid  ) : (
            each.key == "SubOrg1" ? (lookup(data.oci_identity_compartments.sub_org1.compartments[0],"id")) : (
                each.key == "SubOrg2" ? (lookup(data.oci_identity_compartments.sub_org2.compartments[0],"id")) : null)
        )
    )
    display_name = "${each.key}_TARGET"
    state = "ACTIVE"
    target_detector_recipes {
       detector_recipe_id =  oci_cloud_guard_detector_recipe.detector_recipe[each.key].id
    }
    target_resource_id   = (
        each.key == "root_compartment" ? (var.tenancy_ocid  ) : (
            each.key == "SubOrg1" ? (lookup(data.oci_identity_compartments.sub_org1.compartments[0],"id")) : (
                each.key == "SubOrg2" ? (lookup(data.oci_identity_compartments.sub_org2.compartments[0],"id")) : null)
        )
    )
    target_resource_type = "COMPARTMENT"
    target_responder_recipes {
        responder_recipe_id = oci_cloud_guard_responder_recipe.responder_recipe[each.key].id
        responder_rules {
            details {
                condition = "{\"kind\":\"SIMPLE\",\"parameter\":\"region\",\"value\":\"us-ashburn-1\",\"operator\":\"IN\",\"valueType\":\"CUSTOM\"}"
                configurations {
                    config_key = "isPostRemediateNotifyEnabled"
                    name       = "Post Remediation Notification"
                    value      = "true"
                }
            mode = "AUTOACTION"
            }
        responder_rule_id = "MAKE_BUCKET_PRIVATE"
    }
  }
}
