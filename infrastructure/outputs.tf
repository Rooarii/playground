# ---------------------------------------------------------------------------------------------------------------------
# SET UP OUTPUTS
# This file allow to access directly to values defined in terraform or cloud provider components.
# ---------------------------------------------------------------------------------------------------------------------

output "superuser_password" {
  value     = google_secret_manager_secret_version.superuser_password.secret_data
  sensitive = true
}

output "service_url" {
  value = google_cloud_run_service.service.status[0].url
}

output "admin" {
  value     = google_secret_manager_secret_version.django_settings.secret_data
  sensitive = true
}
