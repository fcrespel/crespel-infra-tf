// OVH provider
provider "ovh" {
  endpoint           = var.ovh_endpoint
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

// OpenStack provider
provider "openstack" {
  auth_url    = var.os_auth_url
  region      = var.os_region
  tenant_name = var.os_tenant
  user_name   = var.os_username
  password    = var.os_password
}

// Google Cloud provider
provider "google" {
  credentials = var.gcp_credentials
  project     = var.gcp_project_id
  region      = var.gcp_region
}
