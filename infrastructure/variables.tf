# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters must be supplied.
# ---------------------------------------------------------------------------------------------------------------------
variable "project_id" {
  description = "The id of the GCP projetc"
  type        = string
}

variable "credentials_file" {
  description = "This is the path to the credentials file used to authenticate to GCP"
  type        = string
}
