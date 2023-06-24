output "id" {
  value       = cloudflare_zone.zone.id
  description = "The zone ID of this zone."
}

output "plan" {
  value       = cloudflare_zone.zone.plan
  description = "The name of the commercial plan applied to the zone."
}

output "name_servers" {
  value       = cloudflare_zone.zone.name_servers
  description = "A list of Cloudflare-assigned name servers. This is only populated for zones that use Cloudflare DNS."
}

output "dnssec_algorithm" {
  value       = cloudflare_zone_dnssec.dnssec.algorithm
  description = "The DNSSEC algorithm configured for this zone."
}

output "dnssec_digest" {
  value       = cloudflare_zone_dnssec.dnssec.digest
  description = "The DNSSEC digest check value for this zone."
}

output "dnssec_digest_algorithm" {
  value       = cloudflare_zone_dnssec.dnssec.digest_algorithm
  description = "The DNSSEC digest algorithm configured for this zone."
}

output "dnssec_digest_type" {
  value       = cloudflare_zone_dnssec.dnssec.digest_type
  description = "The DNSSEC digest type configured for this zone."
}

output "dnssec_ds" {
  value       = cloudflare_zone_dnssec.dnssec.ds
  description = "The DS record value for this zone."
}

output "dnssec_flags" {
  value       = cloudflare_zone_dnssec.dnssec.flags
  description = "The DNSSEC flags configured for this zone."
}

output "dnssec_key_tag" {
  value       = cloudflare_zone_dnssec.dnssec.key_tag
  description = "The DNSSEC key tag configured for this zone."
}

output "dnssec_key_type" {
  value       = cloudflare_zone_dnssec.dnssec.key_type
  description = "The DNSSEC key type configured for this zone."
}

output "dnssec_public_key" {
  value       = cloudflare_zone_dnssec.dnssec.public_key
  description = "The DNSSEC public key configured for this zone."
}
