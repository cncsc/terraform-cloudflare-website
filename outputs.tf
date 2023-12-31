output "zone_id" {
  value       = module.zone.id
  description = "The zone ID of the zone."
}

output "plan" {
  value       = module.zone.plan
  description = "The name of the commercial plan applied to the zone."
}

output "name_servers" {
  value       = module.zone.name_servers
  description = "A list of Cloudflare-assigned name servers. This is only populated for zones that use Cloudflare DNS."
}

output "dnssec_algorithm" {
  value       = module.zone.dnssec_algorithm
  description = "The DNSSEC algorithm configured for this zone."
}

output "dnssec_digest" {
  value       = module.zone.dnssec_digest
  description = "The DNSSEC digest check value for this zone."
}

output "dnssec_digest_algorithm" {
  value       = module.zone.dnssec_digest_algorithm
  description = "The DNSSEC digest algorithm configured for this zone."
}

output "dnssec_digest_type" {
  value       = module.zone.dnssec_digest_type
  description = "The DNSSEC digest type configured for this zone."
}

output "dnssec_ds" {
  value       = module.zone.dnssec_ds
  description = "The DS record value for this zone."
}

output "dnssec_flags" {
  value       = module.zone.dnssec_flags
  description = "The DNSSEC flags configured for this zone."
}

output "dnssec_key_tag" {
  value       = module.zone.dnssec_key_tag
  description = "The DNSSEC key tag configured for this zone."
}

output "dnssec_key_type" {
  value       = module.zone.dnssec_key_type
  description = "The DNSSEC key type configured for this zone."
}

output "dnssec_public_key" {
  value       = module.zone.dnssec_public_key
  description = "The DNSSEC public key configured for this zone."
}
