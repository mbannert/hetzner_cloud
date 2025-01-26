variable "hetzner_cloud_api_token" {
  sensitive = true
  type = string
  description = "Hetzner Cloud API Token"
}


variable "hetzner_cloud_dns_token" {
  sensitive = true
  type = string
  description = "Hetzner Cloud DNS Token"
}

variable "public_ip" {
  description = "Public IP address of the server"
  type        = string
  default     = "159.69.90.109"
}


variable "public_ip6" {
  description = "Public IP address of the server"
  type        = string
  default     = "2a01:4f8:d0a:27bd::2"
}
