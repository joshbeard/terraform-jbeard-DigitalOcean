#
# Droplet on DigitalOcean
#
resource "digitalocean_droplet" "pine" {
  image  = "38630129"
  name   = "pine.signalboxes.net"
  region = "nyc1"
  size   = "s-1vcpu-2gb"
}

resource "digitalocean_floating_ip" "pine" {
  droplet_id = digitalocean_droplet.pine.id
  region     = digitalocean_droplet.pine.region
}
