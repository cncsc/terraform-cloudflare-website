# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "account_id" {
  description = "The Cloudflare account ID where the bucket will be provisioned. This account must already be subscribed to R2."
  type        = string
}

variable "r2_access_key" {
  description = "The R2 access key ID used to authenticate to the R2 service for this account."
  type        = string
}

variable "r2_secret_key" {
  description = "The R2 secret key used to authenticate to the R2 service for this account."
  type        = string
}

variable "name" {
  description = "The name of the R2 bucket. This must be unique per account."
  type        = string
}

variable "location_hint" {
  description = "The location hint provided to suggest a region when provisioning the R2 bucket."
  type        = string
  default     = null
}
