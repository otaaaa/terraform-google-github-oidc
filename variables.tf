variable "project_id" {
  type = string
}

variable "pool_id" {
  type = string
}

variable "provider_id" {
  type = string
}

variable "roles" {
  type = list(string)
}

variable "github_user" {
  type = string
}

variable "github_repositories" {
  type = list(string)
}
