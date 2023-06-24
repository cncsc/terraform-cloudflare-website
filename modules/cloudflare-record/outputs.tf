output "id" {
  value       = cloudflare_record.record.id
  description = "The ID of the zone record."
}

output "hostname" {
  value       = cloudflare_record.record.hostname
  description = "The fully qualified domain name (FQDN) of the record."
}

output "proxiable" {
  value       = cloudflare_record.record.proxiable
  description = "Whether or not the record can be proxied by Cloudflare."
}

output "created_on" {
  value       = cloudflare_record.record.created_on
  description = "The RFC3339 timestamp of when the record was created."
}

output "modified_on" {
  value       = cloudflare_record.record.modified_on
  description = "The RFC3339 timestamp of when the record was last modified."
}

output "metadata" {
  value       = cloudflare_record.record.metadata
  description = "A key-value map of string metadata Cloudflare associates with the record."
}
