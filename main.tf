# A service account for Firebase Functions deployments
# through GitHub actions
resource "google_service_account" "service_account_fn_deploys" {
  account_id   = "gh-action-lets-plan-fn-deploys"
  display_name = "GitHub Actions Firebase Cloud Functions Deployment SA"
  description  = "Deployment agent for ${local.repo}"
}

# This ID pool can be used to authenticate the SA
# When using GitHub Actions for the local.repo
resource "google_iam_workload_identity_pool" "workload_id_pool_fn_deploys" {
  workload_identity_pool_id = "gh-action-fn-deploys-pool"
  display_name              = "GH Actions FN Deploy ID Pool"
  description               = "ID Pool for GitHub Actions on ${local.repo}"
}

# Provider linked to the above pool
# Based on: https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions
resource "google_iam_workload_identity_pool_provider" "workload_id_pool_provider_fn_deploys" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.workload_id_pool_fn_deploys.workload_identity_pool_id
  workload_identity_pool_provider_id = "gh-action-fn-deploys-pool-prov"
  display_name                       = "GH Actions FN Dep ODIC Provider"
  description                        = "OIDC Provider for GitHub Actions on ${local.repo}"
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  attribute_condition = "attribute.repository==\"${local.repo}\""
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

# Bind some roles to `service_account_fn_deploys`
# Cloud Functions Admin, Artifact Registry Writer, Firebase Authentication Viewer
# See: https://davelms.medium.com/deploy-firebase-functions-using-github-actions-7dbafbd4df77
# Also see: https://cloud.google.com/functions/docs/reference/iam/roles
resource "google_project_iam_member" "service_account_fn_deploys_role_cloudfunctions_admin" {
  for_each = toset([
    "roles/firebaseauth.viewer",
    "roles/cloudfunctions.admin",
    "roles/artifactregistry.writer"
  ])
  project = local.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.service_account_fn_deploys.email}"
}

# Bind IAM policy for the SA to the Workload ID Pool
resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.service_account_fn_deploys.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.workload_id_pool_fn_deploys.name}/attribute.repository/${local.repo}",
  ]
}
