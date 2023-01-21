terraform {
  backend "gcs" {
    bucket = "lets-plan-infrastructure"
    prefix = ""
  }
}

provider "google" {
  project = local.project_id
  region  = "europe-west1"
}
