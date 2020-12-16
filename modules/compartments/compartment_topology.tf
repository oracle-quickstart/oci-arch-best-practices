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
  for_each = var.level_one_entities
  compartment_id  = oci_identity_compartment.level_one[each.key].id
  description     = "${each.key} Production"
  name            = "PRD_${each.key}"
  enable_delete   = var.compartment_enable_delete
  timeouts{
    delete =  var.delete_timeout
  }
}
resource "oci_identity_compartment" "level_two_dev" {
  for_each = var.level_one_entities
  compartment_id  = oci_identity_compartment.level_one[each.key].id
  description     = "${each.key} Development"
  name            = "DEV_${each.key}"
  enable_delete   = var.compartment_enable_delete
  timeouts{
    delete =  var.delete_timeout
  }
}
resource "oci_identity_compartment" "level_two_qas" {
  for_each = var.level_one_entities
  compartment_id  = oci_identity_compartment.level_one[each.key].id
  description     = "${each.key} QAS"
  name            = "QAS_${each.key}"
  enable_delete   = var.compartment_enable_delete
  timeouts{
    delete =  var.delete_timeout
  }
}


