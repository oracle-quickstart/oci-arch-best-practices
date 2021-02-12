variable tenancy_ocid   {}
variable delete_timeout {
    default = "3h"
}

variable oci_namespaces {
    type = set(string)
    default = [
        "automation",
        "finance",
        "operation",
        "security",        
    ] 
}
variable oci_namespaces_conf {
    type = map
    default = {
        desc_automation     = "NameSpace for tags related with automation"
        desc_finance        = "NameSpace for tags related with credits and ownership"
        desc_operation      = "NameSpace for tags related with operational information"
        desc_security       = "NameSpace for tags related with security  informations"
    }
}
variable "tags_cnf"{
  type = map
  default = {
      //automation tags configuraton name space
      scheduler_action_flag_name            = "off_hours_flag"
      scheduler_action_flag_description     = "Off Hours Scheduler Flag"
      deprovision_action_date_name          = "deprovision_date"
      deprovision_action_date_description   = "Deprovision date"
      //finance tags configuration name space
      owner_name                            = "owner"
      owner_description                     = "Ownership information text based"
      service_active_hours_name             = "active_hours"
      service_active_hours_description      = "Active Hours model list"
      project_name                          = "project"
      project_description                   = "Project Identification"
      //operation tags configuration informaton
      application_name_name                 = "application_name"
      application_name_description          = "Application or Worload Name"
      application_id_name                   = "application_id"
      application_id_description            = "Application or Worload identification"
      resource_layer_name                   = "resource_layer"
      resource_layer_description            = "Resource Layer - dmz app db"
      app_deployment_model_name             = "app_deployment_model"
      app_deployment_model_description      = "Application Model Deployment monolitic, scale-up, scale-out, os_cluster, service_cluster - list"
      environment_name                      = "environment_name"
      environment_description               = "Environment info PRD, DEV, QAS"
      target_compartment_name               = "target_compartment"
      target_compartment_description        = "Target Filter for IAC"
      // Security tags configurton 
      confidenciality_name                  = "confidenciality"
      confidenciality_description           = "Confidenciality classification - list"
      compliance_name                       = "compliance_name"
      compliance_description                = "Compliance standards"


  }
}