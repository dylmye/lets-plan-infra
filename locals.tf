locals {
  # The name of the Google Cloud Project to use.
  project_id = "lets-plan-firebase"
  # The repo where your Firebase Functions are stored.
  repo = "dylmye/lets-plan-firebase-functions"
}

data "google_service_account" "service_account_app_engine_default" {
  // if your project's service account named "App Engine default service account"
  // doesn't follow this format, override it here
  account_id = "${local.project_id}@appspot.gserviceaccount.com"
}
