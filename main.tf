# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# MODULE THAT DEPLOYS A WEBSITE IN CLOUDFLARE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.13"

  required_providers {
    random = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.8.0"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# GENERATE THE VARIABLE PORTION OF THE OUTPUT STRING
# ---------------------------------------------------------------------------------------------------------------------

module "zone" {
  source = "./modules/cloudflare-zone"

  account_id    = var.account_id
  zone          = var.zone
  paused        = var.paused
  plan          = var.plan
  type          = var.type
  jump_start    = var.jump_start
  always_online = var.always_online

  always_use_https            = var.always_use_https
  automatic_https_rewrites    = var.automatic_https_rewrites
  brotli                      = var.brotli
  browser_check               = var.browser_check
  development_mode            = var.development_mode
  email_obfuscation           = var.email_obfuscation
  hotlink_protection          = var.hotlink_protection
  http3                       = var.http3
  ip_geolocation              = var.ip_geolocation
  ipv6                        = var.ipv6
  mirage                      = var.mirage
  opportunistic_encryption    = var.opportunistic_encryption
  opportunistic_onion         = var.opportunistic_onion
  origin_error_page_pass_thru = var.origin_error_page_pass_thru
  prefetch_preload            = var.prefetch_preload
  privacy_pass                = var.privacy_pass
  response_buffering          = var.response_buffering
  rocket_loader               = var.rocket_loader
  server_side_exclude         = var.server_side_exclude
  sort_query_string_for_cache = var.sort_query_string_for_cache
  tls_client_auth             = var.tls_client_auth
  true_client_ip_header       = var.true_client_ip_header
  waf                         = var.waf
  webp                        = var.webp
  websockets                  = var.websockets
  cache_level                 = var.cache_level
  h2_prioritization           = var.h2_prioritization
  image_resizing              = var.image_resizing
  min_tls_version             = var.min_tls_version
  polish                      = var.polish
  pseudo_ipv4                 = var.pseudo_ipv4
  security_level              = var.security_level
  ssl                         = var.ssl
  tls_1_3                     = var.tls_1_3
  browser_cache_ttl           = var.browser_cache_ttl
  challenge_ttl               = var.challenge_ttl
  max_upload                  = var.max_upload
  minify_html                 = var.minify_html
  minify_css                  = var.minify_css
  minify_js                   = var.minify_js
  security_headers_enabled    = var.security_headers_enabled
  preload_header              = var.preload_header
  max_age_header              = var.max_age_header
  include_subdomains          = var.include_subdomains
  nosniff_header              = var.nosniff_header
  universal_ssl               = var.universal_ssl
  zero_rtt                    = var.zero_rtt
}

module "restrictive_spf" {
  source = "./modules/cloudflare-record"
  count  = var.mail_domain == false ? 1 : 0

  zone_id = module.zone.id
  type    = "TXT"
  name    = "@"
  value   = "v=spf1 -all"
}

module "restrictive_dmarc" {
  source = "./modules/cloudflare-record"
  count  = var.mail_domain == false ? 1 : 0

  zone_id = module.zone.id
  type    = "TXT"
  name    = "_dmarc"
  value   = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s"
}

module "restrictive_dkim" {
  source = "./modules/cloudflare-record"
  count  = var.mail_domain == false ? 1 : 0

  zone_id = module.zone.id
  type    = "TXT"
  name    = "*._domainkey"
  value   = "v=DKIM1; p="
}
