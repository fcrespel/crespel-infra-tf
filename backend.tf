terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "fcrespel"

    workspaces {
      name = "crespel-infra-tf"
    }
  }
}
