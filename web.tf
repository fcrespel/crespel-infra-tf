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
    name  = "secrets.gcs.sa"
    value = base64encode(var.web_backups_sa)
  }
  set_sensitive {
    name  = "secrets.s3.accessKeyId"
    value = var.web_backups_s3_access_key_id
  }
  set_sensitive {
    name  = "secrets.s3.secretAccessKey"
    value = var.web_backups_s3_secret_access_key
  }
  set_sensitive {
    name  = "secrets.swift.openrc"
    value = var.web_backups_openrc
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

// Default backend
resource "helm_release" "web_default_backend" {
  name      = "default-backend"
  chart     = "${path.module}/web/charts/default-backend"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/default-backend.yaml")]
}

// Apache web server
resource "helm_release" "web_apache" {
  name      = "apache"
  chart     = "${path.module}/web/charts/apache"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/apache.yaml")]
}

// Collabora Online
resource "helm_release" "web_collabora" {
  name       = "collabora"
  repository = "https://collaboraonline.github.io/online/"
  chart      = "collabora-online"
  version    = var.web_collabora_version
  namespace  = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/collabora.yaml")]

  set_sensitive {
    name  = "collabora.username"
    value = var.web_collabora_username
  }
  set_sensitive {
    name  = "collabora.password"
    value = var.web_collabora_password
  }
}

// KaraPlan
resource "helm_release" "web_karaplan" {
  name      = "karaplan"
  chart     = "${path.module}/web/charts/karaplan"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/karaplan.yaml")]

  set_sensitive {
    name  = "env.SPRING_DATASOURCE_USERNAME"
    value = var.web_karaplan_db_username
  }
  set_sensitive {
    name  = "env.SPRING_DATASOURCE_PASSWORD"
    value = var.web_karaplan_db_password
  }
  set_sensitive {
    name  = "env.SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_GOOGLE_CLIENTID"
    value = var.web_karaplan_google_oauth_clientid
  }
  set_sensitive {
    name  = "env.SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_GOOGLE_CLIENTSECRET"
    value = var.web_karaplan_google_oauth_clientsecret
  }
  set_sensitive {
    name  = "env.SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_GITHUB_CLIENTID"
    value = var.web_karaplan_github_oauth_clientid
  }
  set_sensitive {
    name  = "env.SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_GITHUB_CLIENTSECRET"
    value = var.web_karaplan_github_oauth_clientsecret
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

// Matomo
resource "helm_release" "web_matomo" {
  name      = "matomo"
  chart     = "${path.module}/web/charts/matomo"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/matomo.yaml")]

  set_sensitive {
    name  = "config.matomo.database.username"
    value = var.web_matomo_db_username
  }
  set_sensitive {
    name  = "config.matomo.database.password"
    value = var.web_matomo_db_password
  }
  set_sensitive {
    name  = "config.matomo.General.salt"
    value = var.web_matomo_salt
  }
}

// MySQL database
resource "helm_release" "web_mysql" {
  name      = "mysql"
  chart     = "${path.module}/web/charts/mysql"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/mysql.yaml")]

  set_sensitive {
    name  = "env.MYSQL_ROOT_PASSWORD"
    value = var.web_mysql_root_password
  }
}
resource "helm_release" "web_mysql_slave" {
  name      = "mysql-slave"
  chart     = "${path.module}/web/charts/mysql"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/mysql-slave.yaml")]
}

// Nextcloud
resource "helm_release" "web_nextcloud" {
  name      = "nextcloud"
  chart     = "${path.module}/web/charts/nextcloud"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/nextcloud.yaml")]

  set_sensitive {
    name  = "env.MYSQL_USER"
    value = var.web_nextcloud_db_username
  }
  set_sensitive {
    name  = "env.MYSQL_PASSWORD"
    value = var.web_nextcloud_db_password
  }
  set_sensitive {
    name  = "env.OBJECTSTORE_S3_KEY"
    value = var.web_nextcloud_s3_access_key_id
  }
  set_sensitive {
    name  = "env.OBJECTSTORE_S3_SECRET"
    value = var.web_nextcloud_s3_secret_access_key
  }
}

// phpMyAdmin
resource "helm_release" "web_phpmyadmin" {
  name      = "phpmyadmin"
  chart     = "${path.module}/web/charts/phpmyadmin"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/phpmyadmin.yaml")]
}

// Redis cache server
resource "helm_release" "web_redis" {
  name      = "redis"
  chart     = "${path.module}/web/charts/redis"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/redis.yaml")]
}

// Wordpress
resource "helm_release" "web_wordpress" {
  name      = "wordpress"
  chart     = "${path.module}/web/charts/wordpress"
  namespace = kubernetes_namespace.web_ns.metadata[0].name

  values = [file("${path.module}/web/values/wordpress.yaml")]

  set_sensitive {
    name  = "env.WORDPRESS_DB_USER"
    value = var.web_wordpress_db_username
  }
  set_sensitive {
    name  = "env.WORDPRESS_DB_PASSWORD"
    value = var.web_wordpress_db_password
  }
  set_sensitive {
    name  = "env.WORDPRESS_AUTH_KEY"
    value = var.web_wordpress_auth_key
  }
  set_sensitive {
    name  = "env.WORDPRESS_SECURE_AUTH_KEY"
    value = var.web_wordpress_secure_auth_key
  }
  set_sensitive {
    name  = "env.WORDPRESS_LOGGED_IN_KEY"
    value = var.web_wordpress_logged_in_key
  }
  set_sensitive {
    name  = "env.WORDPRESS_NONCE_KEY"
    value = var.web_wordpress_nonce_key
  }
  set_sensitive {
    name  = "env.WORDPRESS_AUTH_SALT"
    value = var.web_wordpress_auth_salt
  }
  set_sensitive {
    name  = "env.WORDPRESS_SECURE_AUTH_SALT"
    value = var.web_wordpress_secure_auth_salt
  }
  set_sensitive {
    name  = "env.WORDPRESS_LOGGED_IN_SALT"
    value = var.web_wordpress_logged_in_salt
  }
  set_sensitive {
    name  = "env.WORDPRESS_NONCE_SALT"
    value = var.web_wordpress_nonce_salt
  }
  set_sensitive {
    name  = "env.ADVMO_DOS_KEY"
    value = var.web_wordpress_s3_access_key_id
  }
  set_sensitive {
    name  = "env.ADVMO_DOS_SECRET"
    value = var.web_wordpress_s3_secret_access_key
  }
}
