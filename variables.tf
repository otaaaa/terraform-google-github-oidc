variable "project_id" {
  description = "The ID of the Google Cloud project where the Workload Identity Pool and provider will be created."
  type        = string
}

variable "pool_id" {
  description = "The ID of the Workload Identity Pool used to authenticate GitHub Actions via OpenID Connect."
  type        = string
}

variable "provider_id" {
  description = "The ID of the Workload Identity Provider within the pool that trusts GitHub's OIDC tokens."
  type        = string
}

variable "roles" {
  description = "A list of IAM roles to grant to the GitHub service account that will be used by GitHub Actions workflows."
  type        = list(string)
}

variable "github_user" {
  description = "The GitHub organization or user name that owns the repositories authorized to use the OIDC provider."
  type        = string
}

variable "github_repositories" {
  description = "A list of GitHub repository names under the specified user/organization that are allowed to authenticate using this Workload Identity Provider."
  type        = list(string)
}
