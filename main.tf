resource "google_iam_workload_identity_pool" "github_oidc" {
  workload_identity_pool_id = var.pool_id
}

resource "google_iam_workload_identity_pool_provider" "github_oidc" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_oidc.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  attribute_condition                = "assertion.repository_owner == '${var.github_user}'"
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account" "github_oidc" {
  account_id = "github-oidc"
}

resource "google_project_iam_member" "github_oidc" {
  for_each = toset(var.roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.github_oidc.email}"
}

resource "google_service_account_iam_member" "github_oidc" {
  for_each = toset(var.github_repositories)

  service_account_id = google_service_account.github_oidc.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_oidc.name}/attribute.repository/${var.github_user}/${each.value}"
}
