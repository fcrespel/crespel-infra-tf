// OVH S3 buckets
resource "aws_s3_bucket" "s3_bucket_backups" {
  bucket = "${var.storage_bucket_prefix}-backups"
}
resource "aws_s3_bucket" "s3_bucket_nextcloud" {
  bucket = "${var.storage_bucket_prefix}-nextcloud"
}
import {
  to = aws_s3_bucket.s3_bucket_backups
  id = "${var.storage_bucket_prefix}-backups"
}
import {
  to = aws_s3_bucket.s3_bucket_nextcloud
  id = "${var.storage_bucket_prefix}-nextcloud"
}

// GCS bucket for project files
resource "google_storage_bucket" "gcs_bucket_project" {
  name                        = var.gcp_project_id
  project                     = var.gcp_project_id
  location                    = var.gcp_region
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}

// GCS bucket for backups
resource "google_storage_bucket" "gcs_bucket_backups" {
  name                        = "${var.storage_bucket_prefix}-backups"
  project                     = var.gcp_project_id
  location                    = var.gcp_region
  storage_class               = "COLDLINE"
  uniform_bucket_level_access = true
}
resource "google_storage_bucket" "gcs_bucket_nextcloud" {
  name                        = "${var.storage_bucket_prefix}-nextcloud"
  project                     = var.gcp_project_id
  location                    = var.gcp_region
  storage_class               = "COLDLINE"
  uniform_bucket_level_access = true
}

// Service Account with Storage Object Admin role
resource "google_service_account" "gcs_sa" {
  account_id   = "storage-writer"
  project      = var.gcp_project_id
  display_name = "Cloud Storage Writer"
}
resource "google_project_iam_member" "gcs_sa_iam_object_admin" {
  project = var.gcp_project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.gcs_sa.email}"
}
