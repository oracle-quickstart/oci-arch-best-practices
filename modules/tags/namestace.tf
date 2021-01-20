resource "oci_identity_tag_namespace" "namespaces" {
  for_each        = var.oci_namespaces
  description     = var.oci_namespaces_conf["desc_${each.key}"]
  name            = each.key
  compartment_id  = var.tenancy_ocid
}
