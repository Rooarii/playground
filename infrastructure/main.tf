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
      version = "3.5.0"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# PROVIDER BLOCK - GCP
# A provider is a plugin that Terraform uses to create and manage your resources.
# You can define multiple provider blocks in a Terraform configuration to manage resources from different providers.
# ---------------------------------------------------------------------------------------------------------------------
provider "google" {
  credentials = file(var.credentials_file)
  project = var.project_id
  region  = "europe-west1"
  zone = "europe-west1-c"
}

# ---------------------------------------------------------------------------------------------------------------------
# RESOURCE BLOCK - vpc_network
# Use resource blocks to define components of your infrastructure.
# A resource might be a physical component such as a server
# ---------------------------------------------------------------------------------------------------------------------
resource "google_compute_network" "vpc_network" {
  name = "playground-network"
}

# ---------------------------------------------------------------------------------------------------------------------
# RESOURCE BLOCK - vm_instance
# Use resource blocks to define components of your infrastructure.
# A resource might be a physical component such as a server
# ---------------------------------------------------------------------------------------------------------------------
resource "google_compute_instance" "vm_instance" {
  name         = "playground-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2204-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# RESOURCE BLOCK - vm_instance
# Use resource blocks to define components of your infrastructure.
# A resource might be a physical component such as a server
# European multi-region storage bucket
# ---------------------------------------------------------------------------------------------------------------------
resource "google_storage_bucket" "static" {
  name          = "rooarii_bucket_storage"
  location      = "EU"
  storage_class = "STANDARD"

}
