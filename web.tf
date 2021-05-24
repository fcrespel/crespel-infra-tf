// Kubernetes namespace
resource "kubernetes_namespace" "web_ns" {
  metadata {
    name = var.web_namespace
    labels = {
      "name" = var.web_namespace
    }
  }
}

// Network policy for pods in same namespace
resource "kubernetes_network_policy" "web_network_policy_same_ns" {
  metadata {
    name      = "allow-same-namespace"
    namespace = kubernetes_namespace.web_ns.metadata[0].name
  }
  spec {
    policy_types = ["Ingress"]
    pod_selector {
    }
    ingress {
      from {
        pod_selector {
        }
      }
    }
  }
}

// Network policy for ingress
resource "kubernetes_network_policy" "web_network_policy_ingress_nginx" {
  metadata {
    name      = "allow-ingress-nginx"
    namespace = kubernetes_namespace.web_ns.metadata[0].name
  }
  spec {
    policy_types = ["Ingress"]
    pod_selector {
    }
    ingress {
      from {
        namespace_selector {
          match_labels = {
            "name" = "ingress-nginx"
          }
        }
      }
    }
  }
}

// Backups
resource "helm_release" "web_backups" {
  name      = "backups"
  chart     = "${path.module}/web/charts/backups"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/backups.yaml")]

  set_sensitive {
    name  = "secrets.swift.openrc"
    value = var.web_backups_openrc
  }
  set_sensitive {
    name  = "secrets.gcs.sa"
    value = base64encode(var.web_backups_sa)
  }
  set_sensitive {
    name  = "secrets.ftp.username"
    value = var.web_backups_ftp_username
  }
  set_sensitive {
    name  = "secrets.ftp.password"
    value = var.web_backups_ftp_password
  }
  set_sensitive {
    name  = "secrets.mysql.username"
    value = var.web_backups_mysql_username
  }
  set_sensitive {
    name  = "secrets.mysql.password"
    value = var.web_backups_mysql_password
  }
}

// Cron jobs
resource "helm_release" "web_jobs" {
  name      = "jobs"
  chart     = "${path.module}/web/charts/jobs"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/jobs.yaml")]
}

// Apache web server
resource "helm_release" "web_apache" {
  name      = "apache"
  chart     = "${path.module}/web/charts/apache"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/apache.yaml")]
}

// Command Central
resource "helm_release" "web_commandcentral" {
  name      = "commandcentral"
  chart     = "${path.module}/web/charts/commandcentral"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/commandcentral.yaml")]

  set_sensitive {
    name  = "secrets.admin.password"
    value = var.web_commandcentral_admin_password
  }
  set_sensitive {
    name  = "secrets.repo.username"
    value = var.web_commandcentral_repo_username
  }
  set_sensitive {
    name  = "secrets.repo.password"
    value = var.web_commandcentral_repo_password
  }
}

// KaraPlan
resource "kubernetes_secret" "web_karaplan_env_secret" {
  metadata {
    name      = "karaplan-env-secret"
    namespace = kubernetes_namespace.web_ns.metadata[0].name
  }
  data = {
    SPRING_DATASOURCE_USERNAME                                       = var.web_karaplan_db_username
    SPRING_DATASOURCE_PASSWORD                                       = var.web_karaplan_db_password
    SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_GOOGLE_CLIENTID       = var.web_karaplan_google_oauth_clientid
    SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_GOOGLE_CLIENTSECRET   = var.web_karaplan_google_oauth_clientsecret
    SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_FACEBOOK_CLIENTID     = var.web_karaplan_facebook_oauth_clientid
    SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_FACEBOOK_CLIENTSECRET = var.web_karaplan_facebook_oauth_clientsecret
    SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_GITHUB_CLIENTID       = var.web_karaplan_github_oauth_clientid
    SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_GITHUB_CLIENTSECRET   = var.web_karaplan_github_oauth_clientsecret
  }
}
resource "helm_release" "web_karaplan" {
  name      = "karaplan"
  chart     = "${path.module}/web/charts/karaplan"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/karaplan.yaml")]

  set {
    name  = "envFromSecret"
    value = kubernetes_secret.web_karaplan_env_secret.metadata[0].name
  }
}

// LDAP directory
resource "helm_release" "web_ldap" {
  name      = "ldap"
  chart     = "${path.module}/web/charts/ldap"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/ldap.yaml")]

  set_sensitive {
    name  = "secrets.root.password"
    value = var.web_ldap_root_password
  }
}

// Mail server (outbound only)
resource "helm_release" "web_mailserver" {
  name      = "mailserver"
  chart     = "${path.module}/web/charts/mailserver"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/mailserver.yaml")]

  set_sensitive {
    name  = "dkim.config.privateKey"
    value = var.web_mailserver_dkim_private_key
  }
}

// MySQL database
resource "helm_release" "web_mysql" {
  name      = "mysql"
  chart     = "${path.module}/web/charts/mysql"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/mysql.yaml")]

  set_sensitive {
    name  = "secrets.root.password"
    value = var.web_mysql_root_password
  }
}
resource "helm_release" "web_mysql_slave" {
  name      = "mysql-slave"
  chart     = "${path.module}/web/charts/mysql"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/mysql-slave.yaml")]
}

// Nexus repository manager
resource "helm_release" "web_nexus" {
  name      = "nexus"
  chart     = "${path.module}/web/charts/nexus"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/nexus.yaml")]
}

// PHP server
resource "helm_release" "web_php" {
  name      = "php"
  chart     = "${path.module}/web/charts/php"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/php.yaml")]
}

// Redis cache server
resource "helm_release" "web_redis" {
  name      = "redis"
  chart     = "${path.module}/web/charts/redis"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/redis.yaml")]
}
