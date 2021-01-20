/*
This block will create the top level compartments.
Then this example deploy the two compartments respective with
the second level per environemnt: production, development and Q&A.
*/
resource "oci_identity_compartment" "level_one" {
  for_each = var.level_one_entities
  compartment_id  = var.target_ocid
  description     = "Compartment for ${each.key}"
  name            = each.key
  enable_delete   = var.compartment_enable_delete
  defined_tags    = (
      each.key == "network" ? local.compartment_target_network_tags : null
  )
  timeouts{
    delete =  var.delete_timeout
  }

}
/*
Level two compartment organization
*/
resource "oci_identity_compartment" "level_two_prd" {
  for_each = var.company_environment_list
  compartment_id  = oci_identity_compartment.level_one["network"].id
  description     = "${each.key} Production"
  name            = "network_${each.key}"
  enable_delete   = var.compartment_enable_delete
  timeouts{
    delete =  var.delete_timeout
  }
}

/*
SubOrg Session
*/
resource "oci_identity_compartment" "suborg1_project1" {
  compartment_id  = oci_identity_compartment.level_one["SubOrg1"].id
  description     = "project1"
  name            = "project1"
  enable_delete   = var.compartment_enable_delete
  timeouts{
    delete =  var.delete_timeout
  }
}
resource "oci_identity_compartment" "suborg2_project_compartments" {
  for_each = var.company_environment_list
  compartment_id  = oci_identity_compartment.suborg1_project1.id
  description     = "Project 1 ${each.key}"
  name            = "project_1_${each.key}"
  enable_delete   = var.compartment_enable_delete
  timeouts{
    delete =  var.delete_timeout
  }
}
resource "oci_identity_compartment" "suborg2_project1" {
  compartment_id  = oci_identity_compartment.level_one["SubOrg2"].id
  description     = "project1"
  name            = "project1"
  enable_delete   = var.compartment_enable_delete
  timeouts{
    delete =  var.delete_timeout
  }
}
resource "oci_identity_compartment" "suborg2_project1_compartments" {
  for_each = var.company_environment_list
  compartment_id  = oci_identity_compartment.suborg2_project1.id
  description     = "Project 1 ${each.key}"
  name            = "project_1_${each.key}"
  enable_delete   = var.compartment_enable_delete
  timeouts{
    delete =  var.delete_timeout
  }
}
