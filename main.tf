terraform {
  required_version = ">= 0.10.0"
}

provider "digitalocean" {
  token = "${var.digitalocean_token}"
}

# Local shell username to identify with droplet name
data "external" "tfuser" {
  program = ["sh", "-c", "echo '{\"name\":\"'$(whoami)'\"}'"]
}

resource "digitalocean_droplet" "instance" {
  count = "${var.droplet_count}"

  name = "${format(
    "%s-%s-%s-%s-%02d",
    replace(var.droplet_image, "/-.*/", ""),
    data.external.tfuser.result.name,
    var.droplet_size,
    var.droplet_region,
    count.index + 1
  )}"

  size     = "${var.droplet_size}"
  image    = "${var.droplet_image}"
  region   = "${var.droplet_region}"
  ssh_keys = ["${var.digitalocean_fingerprints}"]
}

# Output IPv4 addresses droplets
output "droplet_ipv4" {
  value = "${zipmap(digitalocean_droplet.instance.*.name, digitalocean_droplet.instance.*.ipv4_address)}"
}
