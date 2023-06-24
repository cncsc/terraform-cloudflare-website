# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PROVISION A CLOUDFLARE RECORD
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.13"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.8.0"
    }
  }
}

# Because the Cloudflare provider treats `value` and `data` as exclusive properties (even when either has a null value)
# we need to conditionally create these resources separately.

resource "cloudflare_record" "record" {
  zone_id  = var.zone_id
  name     = var.name
  value    = var.value
  type     = var.type
  ttl      = var.ttl
  priority = var.priority
  proxied  = var.proxied
  comment  = var.comment
}
