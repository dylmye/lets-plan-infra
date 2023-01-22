<p align="center">
  <a href="https://lets-plan.ninja">
    <img src="https://raw.githubusercontent.com/dylmye/lets-plan/main/logo.png" alt="Let's Plan logo" height="96">
  </a>
</p>

<p align="center">
  <a href="https://github.com/dylmye/lets-plan-infra/blob/main/LICENSE"><img alt="The status badge for the licence of this project" src="https://img.shields.io/github/license/dylmye/lets-plan-infra"></a>
  <a href="https://snyk.io"><img alt="The status badge for the Snyk-detected vulnerabilities count for this project" src="https://img.shields.io/snyk/vulnerabilities/github/dylmye/lets-plan-infra?logo=snyk"></a>
</p>

<p align="center">
    <a href="https://github.com/dylmye/lets-plan">Webapp</a> •
    <strong>Infrastructure</strong> •
    <a href="https://github.com/dylmye/lets-plan-firebase-functions">Firebase Functions</a>
</p>

---

## Terraform Infrastructure

A Terraform configuration for various non-Firebase parts of the Let's Plan infrastructure.


### Install

**Pre-requisites:**

* [Google Cloud SDK CLI](https://cloud.google.com/sdk/docs/install) - log in and select your Firebase Blaze project via `gcloud init`
* Terraform, ideally through a version manager like [tfvm](https://github.com/cbuschka/tfvm) or [tfvm-windows](https://github.com/jsterner30/tfvm-windows)

0. Log in with your Application Default Credentials (ADCs): `gcloud auth application-default login` - this will open a browser pop-up asking you to authenticate with Google Auth Library
1. Set the project for billing & quotas: `gcloud auth application-default set-quota-project your-firebase-project-here`
2. `terraform init`, `terraform plan`, etc
