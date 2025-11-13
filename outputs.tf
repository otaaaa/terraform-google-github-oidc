output "github_oidc_sa_email" {
  description = "The email address of the service account used by GitHub Actions via Workload Identity Federation."
  value       = google_service_account.github_oidc.email
}
