resource "oci_identity_group" "grp" {
  for_each          = var.oci_local_groups
  name              = each.key
  description       = var.oci_local_groups_conf["desc_${each.key}"]
  compartment_id    = var.tenancy_ocid
  timeouts{
    delete =  var.delete_timeout
  }
}
