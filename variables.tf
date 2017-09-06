# Token to access the DigitalOcean API
variable "digitalocean_token" {}

# Fingerprints of SSH key(s) to authorize for connections to droplets
variable "digitalocean_fingerprints" {
  type = "list"
}

variable "droplet_count" {
  default = 0
}

variable "droplet_size" {}
variable "droplet_image" {}
variable "droplet_region" {}
