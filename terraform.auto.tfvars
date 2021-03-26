# OVH provider
ovh_endpoint = "ovh-eu"
#ovh_application_key = "toComplete"
#ovh_application_secret = "toComplete"
#ovh_consumer_key = "toComplete"

# GCP provider
#gcp_credentials = "toComplete"
gcp_project_id = "crespel-me"
gcp_region = "europe-west1"

# DNS config
dns_zone = "crespel.me"
dns_records = [
  { name = "",                        ttl = 0,     type = "A",      target = "5.39.85.174" },
  { name = "",                        ttl = 0,     type = "AAAA",   target = "2001:41d0:8:97ae::1" },
  { name = "",                        ttl = 0,     type = "CAA",    target = "128 issue \"letsencrypt.org\"" },
  { name = "",                        ttl = 0,     type = "MX",     target = "1 mx4.mail.ovh.net." },
  { name = "",                        ttl = 0,     type = "MX",     target = "10 mx3.mail.ovh.net." },
  { name = "",                        ttl = 600,   type = "SPF",    target = "\"v=spf1 a:ks11.srv.fabinfra.net a:sy02.srv.fabinfra.net include:mx.ovh.com ?all\"" },
  { name = "",                        ttl = 0,     type = "TXT",    target = "\"google-site-verification=xZc65WFJ6F-kdnhv2LBjUQ9_m-nuc-dFzO8yxCTX9_k\"" },
  { name = "*.dev",                   ttl = 1800,  type = "CNAME",  target = "dev" },
  { name = "blog",                    ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "blogs",                   ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "cloud",                   ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "dev",                     ttl = 0,     type = "A",      target = "192.168.0.102" },
  { name = "docker",                  ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "fab-desktop.home",        ttl = 0,     type = "A",      target = "192.168.0.111" },
  { name = "fab-desktop.vpn",         ttl = 0,     type = "A",      target = "10.8.2.6" },
  { name = "fab-laptop.home",         ttl = 0,     type = "A",      target = "192.168.0.113" },
  { name = "fab-laptop.vpn",          ttl = 0,     type = "A",      target = "10.8.2.10" },
  { name = "fab-precision7530.home",  ttl = 0,     type = "A",      target = "192.168.0.112" },
  { name = "fab-precision7530.vpn",   ttl = 0,     type = "A",      target = "10.8.2.14" },
  { name = "fab-work.home",           ttl = 0,     type = "A",      target = "192.168.0.114" },
  { name = "fab-work.vpn",            ttl = 0,     type = "A",      target = "10.8.2.18" },
  { name = "fabien",                  ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "files",                   ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "jean-laptop.vpn",         ttl = 0,     type = "A",      target = "10.8.2.30" },
  { name = "karaplan",                ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "march2016._domainkey",    ttl = 0,     type = "DKIM",   target = "k=rsa;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwvjrMuYA4hkI0TMzk6h4Hec06Unn/qZUxf4YnR5OWkCYrlIJZXuOUIsYZMXTiXCEhPdO6JktOcdVcUyB8UdhGLv7PoMShG+Kb9zsfqOtLJ3dfzJuaBsoV0BEi4yLqXPTNqbzE4YtxynC11MfPrtxwIYmJ5p4S2RMztBTZC5g/1PoQ2UWk/NphEzO6iA4Bbtas1OD+44Moa1OYMbi3YZrmEn1WTfrWodunAYE92Usoj+kpSiBqhYPS/r8iQMOsRZOznDZhxG7VIYGU5xq+Ah0hpWoU/Nvs79LBP0pgC7vyCRXec18Q7Ix3t7WaYOZv5/GfhbcWREM0wVAsEQYjVp9cwIDAQAB;t=s;" },
  { name = "oculus.home",             ttl = 0,     type = "A",      target = "192.168.0.119" },
  { name = "services",                ttl = 1800,  type = "CNAME",  target = "srv01" },
  { name = "srv01",                   ttl = 1800,  type = "CNAME",  target = "k8s.fabinfra.net." },
  { name = "vpn",                     ttl = 1800,  type = "CNAME",  target = "vpn.fabinfra.net." },
  { name = "www",                     ttl = 1800,  type = "CNAME",  target = "srv01" },
]
