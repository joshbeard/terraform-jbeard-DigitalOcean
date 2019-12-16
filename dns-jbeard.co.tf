#
# DigitalOcean DNS for jbeard.co
#

# Create a new domain
resource "digitalocean_domain" "jbeard_co" {
  name       = "jbeard.co"
}

resource "digitalocean_record" "jbeard_co_a" {
  domain = digitalocean_domain.jbeard_co.name
  type   = "A"
  name   = "@"
  value  = digitalocean_floating_ip.pine.ip_address
}

resource "digitalocean_record" "jbeard_co_wildcard" {
  domain = digitalocean_domain.jbeard_co.name
  type   = "CNAME"
  name   = "*.jbeard.co."
  value  = "jbeard.co."
}

# Add a record to the domain
#resource "digitalocean_record" "jbeard_co_ns1" {
#  domain = digitalocean_domain.jbeard_co.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns1.digitalocean.com."
#}
#
#resource "digitalocean_record" "jbeard_co_ns2" {
#  domain = digitalocean_domain.jbeard_co.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns2.digitalocean.com."
#}
#
#resource "digitalocean_record" "jbeard_co_ns3" {
#  domain = digitalocean_domain.jbeard_co.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns3.digitalocean.com."
#}

resource "digitalocean_record" "jbeard_co_mx1" {
  domain = digitalocean_domain.jbeard_co.name
  type   = "MX"
  name   = "@"
  value  = "aspmx1.migadu.com."
  priority = "10"
}

resource "digitalocean_record" "jbeard_co_mx2" {
  domain = digitalocean_domain.jbeard_co.name
  type   = "MX"
  name   = "@"
  value  = "aspmx2.migadu.com."
  priority = "20"
}

resource "digitalocean_record" "jbeard_co_spf" {
  domain = digitalocean_domain.jbeard_co.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 a mx include:spf.migadu.com ~all"
}

resource "digitalocean_record" "jbeard_co_dkim" {
  domain = digitalocean_domain.jbeard_co.name
  type   = "TXT"
  name   = "default._domainkey.jbeard.co."
  value  = "v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwLut0Bap/mh3HE2rDPchHVrEcaKAfE1X5/k+7fBiIdRgk8GFoMiG3WpbaWygLS0Hw03ZjdeiIPQW/bfB7tz88NIwhIlq4VI2w+oBjF9pciLgzu0gFRGEC1KdRjn7M3YD/KTURS9kAAkgLKFWXqrUsuhuM00mZQn72MA/N9DSPfwIDAQAB"
}

resource "digitalocean_record" "jbeard_co_dmarc" {
  domain = digitalocean_domain.jbeard_co.name
  type   = "TXT"
  name   = "_dmarc.jbeard.co."
  value  = "v=DMARC1; p=none; fo=1; rua=mailto:admin@jbeard.co"
}