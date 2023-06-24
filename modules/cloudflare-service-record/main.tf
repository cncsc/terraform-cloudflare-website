# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PROVISION A CLOUDFLARE SERVICE RECORD
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

resource "cloudflare_record" "record" {
  zone_id  = var.zone_id
  name     = var.name
  type     = var.type
  ttl      = var.ttl
  priority = var.priority
  comment  = var.comment

  data {
    service  = var.service_type
    proto    = var.service_protocol
    name     = var.service_name
    priority = var.service_priority
    weight   = var.service_weight
    port     = var.service_port
    target   = var.service_target
  }
}
