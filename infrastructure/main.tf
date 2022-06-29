# ---------------------------------------------------------------------------------------------------------------------
# Terraform BLOCK
# The terraform {} block contains Terraform settings, including the required providers Terraform will use to provision
# your infrastructure.
# For each provider, the source attribute defines an optional hostname, a namespace, and the provider type.
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.27"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# PROVIDER BLOCK - GCP
# A provider is a plugin that Terraform uses to create and manage your resources.
# You can define multiple provider blocks in a Terraform configuration to manage resources from different providers.
# ---------------------------------------------------------------------------------------------------------------------
provider "google" {
  project     = var.project
  region      = var.region
}

# ---------------------------------------------------------------------------------------------------------------------
# SERVICE APIs - GCP
# Service APIs are APIs that allows to use ceratins resources or service of a provider.
# You can use multiple service APIs for multiple type of infrastructure.
# ---------------------------------------------------------------------------------------------------------------------

# Cloud Run: Serverless service API
resource "google_project_service" "run" {
  service            = "run.googleapis.com"
  disable_on_destroy = false
}

# Cloud SQL Admin: SQL (MySQL, PostgreSQL, SQL Server) instance administration service API
resource "google_project_service" "sqladmin" {
  service            = "sqladmin.googleapis.com"
  disable_on_destroy = false
}

# GCP virtual machines creation & running service API
resource "google_project_service" "compute" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

# GCP build creation and management service API
resource "google_project_service" "cloudbuild" {
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

# GCP secrets manager (API keys, passwords, and certificates) service API
resource "google_project_service" "secretmanager" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

# ---------------------------------------------------------------------------------------------------------------------
# SERVICE ACCOUNT - GCP
# Allows management of a Google Cloud service account
# Applications use service accounts to make authorized API calls
# ---------------------------------------------------------------------------------------------------------------------
resource "google_service_account" "django" {
  account_id = "django"
}

# ---------------------------------------------------------------------------------------------------------------------
# DATABASE CREATION
# --------------------------------------------------------------------------------------------------------------------
resource "random_password" "database_password" {
  length  = 32
  special = false
}

resource "google_sql_database_instance" "instance" {
  name             = "personnal_website"
  database_version = "POSTGRES_14"
  region           = "eu-central1"
  settings {
    tier = "db-f1-micro"
  }
  deletion_protection = true
}

resource "google_sql_database" "database" {
  name     = "django"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "django" {
  name     = "django"
  instance = google_sql_database_instance.instance.name
  password = random_password.database_password.result
}
