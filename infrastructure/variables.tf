# ---------------------------------------------------------------------------------------------------------------------
# SET UP REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  type        = string
  description = "The ID of the GCP project"
}

variable "region" {
  type        = string
  default     = "eu-central1"
  description = "Google Cloud Region"
}

variable "service" {
  type        = string
  default     = "personnal_website"
  description = "The name of the service"
}