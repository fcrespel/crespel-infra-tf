// OVH provider
variable "ovh_endpoint" {
  description = "OVH API endpoint"
}
variable "ovh_application_key" {
  description = "OVH application key"
  sensitive   = true
}
variable "ovh_application_secret" {
  description = "OVH application secret"
  sensitive   = true
}
variable "ovh_consumer_key" {
  description = "OVH consumer key"
  sensitive   = true
}

// OpenStack provider
variable "os_auth_url" {
  description = "OpenStack authentication URL"
}
variable "os_region" {
  description = "OpenStack region name"
}
variable "os_tenant" {
  description = "OpenStack tenant name"
}
variable "os_username" {
  description = "OpenStack username"
}
variable "os_password" {
  description = "OpenStack password"
  sensitive   = true
}

// Google Cloud provider
variable "gcp_credentials" {
  description = "Terraform service account credentials JSON file"
  sensitive   = true
}
variable "gcp_project_id" {
  description = "GCP project ID"
}
variable "gcp_region" {
  description = "GCP region"
}

// Kubernetes provider
variable "k8s_host" {
  description = "Kubernetes master host name"
}
variable "k8s_client_cert" {
  description = "Kubernetes client certificate (base64-encoded PEM)"
}
variable "k8s_client_key" {
  description = "Kubernetes client private key (base64-encoded PEM)"
  sensitive   = true
}
variable "k8s_ca_cert" {
  description = "Kubernetes cluster CA certificate (base64-encoded PEM)"
}

// DNS records
variable "dns_zone" {
  description = "DNS zone name"
}
variable "dns_records" {
  default = []
  type = list(object({
    name   = string
    ttl    = number
    type   = string
    target = string
  }))
  description = "DNS records"
}

// Web
variable "web_namespace" {
  description = "Web Kubernetes namespace"
}
variable "web_backups_openrc" {
  description = "OpenStack openrc file for backups"
  sensitive   = true
}
variable "web_backups_sa" {
  description = "Google Service Account JSON key for backups"
  sensitive   = true
}
variable "web_backups_ftp_username" {
  description = "FTP username for backups"
}
variable "web_backups_ftp_password" {
  description = "FTP password for backups"
  sensitive   = true
}
variable "web_backups_mysql_username" {
  description = "MySQL username for backups"
}
variable "web_backups_mysql_password" {
  description = "MySQL password for backups"
  sensitive   = true
}
variable "web_commandcentral_admin_password" {
  description = "Command Central admin user password"
  sensitive   = true
}
variable "web_commandcentral_repo_username" {
  description = "Command Central repository user name"
}
variable "web_commandcentral_repo_password" {
  description = "Command Central repository user password"
  sensitive   = true
}
variable "web_karaplan_db_username" {
  description = "KaraPlan database user name"
}
variable "web_karaplan_db_password" {
  description = "KaraPlan database user password"
  sensitive   = true
}
variable "web_karaplan_google_oauth_clientid" {
  description = "KaraPlan Google OAuth 2.0 client ID"
}
variable "web_karaplan_google_oauth_clientsecret" {
  description = "KaraPlan Google OAuth 2.0 client secret"
  sensitive   = true
}
variable "web_karaplan_facebook_oauth_clientid" {
  description = "KaraPlan Facebook OAuth 2.0 client ID"
}
variable "web_karaplan_facebook_oauth_clientsecret" {
  description = "KaraPlan Facebook OAuth 2.0 client secret"
  sensitive   = true
}
variable "web_karaplan_github_oauth_clientid" {
  description = "KaraPlan GitHub OAuth 2.0 client ID"
}
variable "web_karaplan_github_oauth_clientsecret" {
  description = "KaraPlan GitHub OAuth 2.0 client secret"
  sensitive   = true
}
variable "web_ldap_root_password" {
  description = "LDAP root password"
  sensitive   = true
}
variable "web_mailserver_dkim_private_key" {
  description = "DKIM private key (PEM-encoded)"
  sensitive   = true
}
variable "web_matomo_db_username" {
  description = "Matomo database username"
}
variable "web_matomo_db_password" {
  description = "Matomo database password"
  sensitive   = true
}
variable "web_matomo_salt" {
  description = "Matomo authentication salt"
  sensitive   = true
}
variable "web_mysql_root_password" {
  description = "MySQL root password"
  sensitive   = true
}
variable "web_nextcloud_db_username" {
  description = "Nextcloud database username"
}
variable "web_nextcloud_db_password" {
  description = "Nextcloud database password"
  sensitive   = true
}
variable "web_nextcloud_swift_username" {
  description = "Nextcloud OpenStack Swift object store username"
}
variable "web_nextcloud_swift_password" {
  description = "Nextcloud OpenStack Swift object store password"
  sensitive   = true
}
variable "web_wordpress_db_username" {
  description = "Wordpress database username"
}
variable "web_wordpress_db_password" {
  description = "Wordpress database password"
  sensitive   = true
}
variable "web_wordpress_auth_key" {
  description = "Wordpress auth key"
  sensitive   = true
}
variable "web_wordpress_secure_auth_key" {
  description = "Wordpress secure auth key"
  sensitive   = true
}
variable "web_wordpress_logged_in_key" {
  description = "Wordpress logged in key"
  sensitive   = true
}
variable "web_wordpress_nonce_key" {
  description = "Wordpress nonce key"
  sensitive   = true
}
variable "web_wordpress_auth_salt" {
  description = "Wordpress auth salt"
  sensitive   = true
}
variable "web_wordpress_secure_auth_salt" {
  description = "Wordpress secure auth salt"
  sensitive   = true
}
variable "web_wordpress_logged_in_salt" {
  description = "Wordpress logged in salt"
  sensitive   = true
}
variable "web_wordpress_nonce_salt" {
  description = "Wordpress nonce salt"
  sensitive   = true
}

// Uptime checks
variable "uptime_check_urls" {
  default     = []
  type        = list(string)
  description = "Uptime check HTTPS URLs"
}
variable "uptime_check_notification_email" {
  description = "Uptime check notification email address"
}
