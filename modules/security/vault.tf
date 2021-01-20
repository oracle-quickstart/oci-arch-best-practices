/*
OCI Vault help to obtain an centralized management of encryption keys that protect secret credentials and data.
Is an transversal resource that will be reused to other resources. And following the exemple we will create an 
vault for our target compartment that will represent an department or sub organization.
*/
resource "oci_kms_vault" "target_vault" {
    compartment_id = var.target_compartment_ocid
    display_name = var.vault_config["vault_1_name"]
    vault_type = var.vault_config["vault_1_type"]
}