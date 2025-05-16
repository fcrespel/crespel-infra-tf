# OVH provider
ovh_endpoint = "ovh-eu"
#ovh_application_key = "toComplete"
#ovh_application_secret = "toComplete"
#ovh_consumer_key = "toComplete"
#ovh_project_id = "toComplete"
ovh_region = "RBX"

# GCP provider
#gcp_credentials = "toComplete"
gcp_project_id = "crespel-me"
gcp_region = "europe-west1"

# Grafana provider
grafana_url = "https://fabinfra.grafana.net/"
#grafana_auth = "toComplete"
grafana_sm_url = "https://synthetic-monitoring-api.grafana.net"
#grafana_sm_access_token = "toComplete"

# Kubernetes provider
k8s_host = "https://k8s-master.fabinfra.net:6443"
#k8s_ca_cert = "toComplete"
#k8s_token = "toComplete"

# DNS config
dns_zone = "crespel.me"
dns_records = [
  { name = "",                        ttl = 1800,  type = "A",      target = "94.23.252.71" },
  { name = "",                        ttl = 1800,  type = "AAAA",   target = "2001:41d0:2:7f47::1" },
  { name = "",                        ttl = 3600,  type = "CAA",    target = "128 issue \"letsencrypt.org\"" },
  { name = "",                        ttl = 3600,  type = "MX",     target = "1 mx4.mail.ovh.net." },
  { name = "",                        ttl = 3600,  type = "MX",     target = "10 mx3.mail.ovh.net." },
  { name = "",                        ttl = 600,   type = "SPF",    target = "\"v=spf1 include:fabinfra.net -all\"" },
  { name = "",                        ttl = 300,   type = "TXT",    target = "\"google-site-verification=xZc65WFJ6F-kdnhv2LBjUQ9_m-nuc-dFzO8yxCTX9_k\"" },
  { name = "_dmarc",                  ttl = 600,   type = "DMARC",  target = "v=DMARC1;p=none;rua=mailto:postmaster@crespel.me;" },
  { name = "*.dev",                   ttl = 1800,  type = "CNAME",  target = "dev" },
  { name = "blog",                    ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "blogs",                   ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "cloud",                   ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "dev",                     ttl = 300,   type = "A",      target = "192.168.0.102" },
  { name = "fab-adeo.home",           ttl = 300,   type = "A",      target = "192.168.0.117" },
  { name = "fab-cgi.home",            ttl = 300,   type = "A",      target = "192.168.0.114" },
  { name = "fab-cgi.vpn",             ttl = 300,   type = "A",      target = "10.8.2.18" },
  { name = "fab-precision3580.home",  ttl = 300,   type = "A",      target = "192.168.0.118" },
  { name = "fab-precision3580.vpn",   ttl = 300,   type = "A",      target = "10.8.2.10" },
  { name = "fab-precision7530.home",  ttl = 300,   type = "A",      target = "192.168.0.112" },
  { name = "fab-precision7530.vpn",   ttl = 300,   type = "A",      target = "10.8.2.14" },
  { name = "fabien",                  ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "files",                   ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "homeassistant",           ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "jean-laptop.vpn",         ttl = 300,   type = "A",      target = "10.8.2.30" },
  { name = "karaplan",                ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "march2016._domainkey",    ttl = 3600,  type = "DKIM",   target = "k=rsa;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwvjrMuYA4hkI0TMzk6h4Hec06Unn/qZUxf4YnR5OWkCYrlIJZXuOUIsYZMXTiXCEhPdO6JktOcdVcUyB8UdhGLv7PoMShG+Kb9zsfqOtLJ3dfzJuaBsoV0BEi4yLqXPTNqbzE4YtxynC11MfPrtxwIYmJ5p4S2RMztBTZC5g/1PoQ2UWk/NphEzO6iA4Bbtas1OD+44Moa1OYMbi3YZrmEn1WTfrWodunAYE92Usoj+kpSiBqhYPS/r8iQMOsRZOznDZhxG7VIYGU5xq+Ah0hpWoU/Nvs79LBP0pgC7vyCRXec18Q7Ix3t7WaYOZv5/GfhbcWREM0wVAsEQYjVp9cwIDAQAB;t=s;" },
  { name = "oculus.home",             ttl = 300,   type = "A",      target = "192.168.0.119" },
  { name = "services",                ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "srv01",                   ttl = 1800,  type = "CNAME",  target = "k8s-ingress.fabinfra.net." },
  { name = "vpn",                     ttl = 1800,  type = "CNAME",  target = "vpn.fabinfra.net." },
  { name = "www",                     ttl = 1800,  type = "CNAME",  target = "srv01" },
]

# Storage
storage_bucket_prefix = "crespel-me"
storage_bucket_names = [ "backups", "blogs", "nextcloud" ]

# Web
web_namespace = "domain-crespel-me"
#web_backups_openrc = "toComplete"
#web_backups_sa = "toComplete"
#web_backups_s3_access_key_id = "toComplete"
#web_backups_s3_secret_access_key = "toComplete"
#web_backups_mysql_username = "toComplete"
#web_backups_mysql_password = "toComplete"
#web_karaplan_db_username = "toComplete"
#web_karaplan_db_password = "toComplete"
#web_karaplan_google_oauth_clientid = "toComplete"
#web_karaplan_google_oauth_clientsecret = "toComplete"
#web_karaplan_github_oauth_clientid = "toComplete"
#web_karaplan_github_oauth_clientsecret = "toComplete"
#web_ldap_root_password = "toComplete"
#web_mailserver_dkim_private_key = "toComplete"
#web_matomo_db_username = "toComplete"
#web_matomo_db_password = "toComplete"
#web_matomo_salt = "toComplete"
#web_mysql_root_password = "toComplete"
#web_nextcloud_db_username = "toComplete"
#web_nextcloud_db_password = "toComplete"
#web_nextcloud_s3_access_key_id = "toComplete"
#web_nextcloud_s3_secret_access_key = "toComplete"
#web_wordpress_db_username = "toComplete"
#web_wordpress_db_password = "toComplete"
#web_wordpress_auth_key = "toComplete"
#web_wordpress_secure_auth_key = "toComplete"
#web_wordpress_logged_in_key = "toComplete"
#web_wordpress_nonce_key = "toComplete"
#web_wordpress_auth_salt = "toComplete"
#web_wordpress_secure_auth_salt = "toComplete"
#web_wordpress_logged_in_salt = "toComplete"
#web_wordpress_nonce_salt = "toComplete"
#web_wordpress_s3_access_key_id = "toComplete"
#web_wordpress_s3_secret_access_key = "toComplete"

# Uptime checks
uptime_check_urls = [
 "https://blogs.crespel.me/",
 "https://cloud.crespel.me/",
 "https://karaplan.crespel.me/actuator/health"
]
uptime_frequency = 300000
uptime_timeout = 10000
