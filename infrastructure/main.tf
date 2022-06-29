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
