# terraform-google-github-oidc

This is a Terraform module that enables authentication to Google Cloud Platform using OpenID Connect within a GitHub Actions workflow.

## Usage

```hcl
module "github_oidc" {
  source  = "otaaaa/github-oidc/google"

  project_id  = "foo"
  pool_id     = "bar"
  provider_id = "baz"
  roles = [
    "roles/artifactregistry.writer",
    "roles/secretmanager.secretAccessor",
    "roles/storage.admin",
  ]
  github_user         = "otaaaa"
  github_repositories = ["foo"]
}
```
