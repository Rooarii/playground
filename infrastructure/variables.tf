# ---------------------------------------------------------------------------------------------------------------------
# SET UP REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  type        = string
  description = "The ID of the GCP project"
}

variable "region" {
  type        = string
  default     = "europe-west9"
  description = "Google Cloud Region"
}

variable "service" {
  type        = string
  default     = "postgres"
  description = "The name of the service"
}

variable "database_version" {
  type        = string
  default     = "POSTGRES_14"
  description = "The version of the database"
}