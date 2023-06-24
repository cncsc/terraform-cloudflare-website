# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PROVISION A CLOUDFLARE R2 BUCKET
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.13"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.8.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws" {
  access_key                  = var.r2_access_key
  secret_key                  = var.r2_secret_key
  skip_credentials_validation = true
  skip_region_validation      = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "https://${var.account_id}.r2.cloudflarestorage.com"
  }
}

resource "cloudflare_r2_bucket" "bucket" {
  account_id = var.account_id
  name       = var.name
  location   = var.location_hint
}

resource "aws_s3_bucket_cors_configuration" "cors" {
  bucket = cloudflare_r2_bucket.bucket.id

  cors_rule {
    allowed_origins = ["*"]
    allowed_methods = [
      "GET",
      "OPTIONS",
    ]
  }
}
