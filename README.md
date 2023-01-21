<p align="center">
  <a href="https://lets-plan.ninja">
    <img src="https://raw.githubusercontent.com/dylmye/lets-plan/main/logo.png" alt="Let's Plan logo" height="96">
  </a>
</p>

## Terraform Infrastructure

A Terraform configuration for various non-Firebase parts of the Let's Plan infrastructure.

----

### Install

**Pre-requisites:**

* [Google Cloud SDK CLI](https://cloud.google.com/sdk/docs/install) - log in and select your Firebase Blaze project via `gcloud init`
* Terraform, ideally through a version manager like [tfvm](https://github.com/cbuschka/tfvm) or [tfvm-windows](https://github.com/jsterner30/tfvm-windows)

0. Log in with your Application Default Credentials (ADCs): `gcloud auth application-default login` - this will open a browser pop-up asking you to authenticate with Google Auth Library
1. Set the project for billing & quotas: `gcloud auth application-default set-quota-project your-firebase-project-here`
2. `terraform init`, `terraform plan`, etc
