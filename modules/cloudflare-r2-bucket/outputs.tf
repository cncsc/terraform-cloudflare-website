output "bucket_id" {
  value       = cloudflare_r2_bucket.bucket.id
  description = "The ID of the R2 bucket."
}
