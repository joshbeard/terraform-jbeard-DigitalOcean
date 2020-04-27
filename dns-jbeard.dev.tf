#
# DigitalOcean DNS for jbeard.dev
#

# Create a new domain
resource "digitalocean_domain" "jbeard_dev" {
  name       = "jbeard.dev"
}

resource "digitalocean_record" "jbeard_dev_a" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "A"
  name   = "@"
  value  = digitalocean_floating_ip.pine.ip_address
}

resource "digitalocean_record" "jbeard_dev_wildcard" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "CNAME"
  name   = "*.jbeard.dev."
  value  = "jbeard.dev."
}

# Add a record to the domain
#resource "digitalocean_record" "jbeard_dev_ns1" {
#  domain = digitalocean_domain.jbeard_dev.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns1.digitalocean.com."
#}
#
#resource "digitalocean_record" "jbeard_dev_ns2" {
#  domain = digitalocean_domain.jbeard_dev.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns2.digitalocean.com."
#}
#
#resource "digitalocean_record" "jbeard_dev_ns3" {
#  domain = digitalocean_domain.jbeard_dev.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns3.digitalocean.com."
#}

resource "digitalocean_record" "jbeard_dev_mx1" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "MX"
  name   = "@"
  value  = "aspmx1.migadu.com."
  priority = "10"
}

resource "digitalocean_record" "jbeard_dev_mx2" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "MX"
  name   = "@"
  value  = "aspmx2.migadu.com."
  priority = "20"
}

resource "digitalocean_record" "jbeard_dev_spf" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:spf.migadu.com -all"
}

resource "digitalocean_record" "jbeard_dev_dkim" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "TXT"
  name   = "default._domainkey.jbeard.dev."
  value  = "v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwLut0Bap/mh3HE2rDPchHVrEcaKAfE1X5/k+7fBiIdRgk8GFoMiG3WpbaWygLS0Hw03ZjdeiIPQW/bfB7tz88NIwhIlq4VI2w+oBjF9pciLgzu0gFRGEC1KdRjn7M3YD/KTURS9kAAkgLKFWXqrUsuhuM00mZQn72MA/N9DSPfwIDAQAB"
}

resource "digitalocean_record" "jbeard_dev_dkim1" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "CNAME"
  name   = "key1._domainkey.jbeard.dev."
  value  = "key1.jbeard.dev._domainkey.migadu.com."
}

resource "digitalocean_record" "jbeard_dev_dkim2" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "CNAME"
  name   = "key2._domainkey.jbeard.dev."
  value  = "key2.jbeard.dev._domainkey.migadu.com."
}

resource "digitalocean_record" "jbeard_dev_dkim3" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "CNAME"
  name   = "key3._domainkey.jbeard.dev."
  value  = "key3.jbeard.dev._domainkey.migadu.com."
}

# DMARC
resource "digitalocean_record" "jbeard_dev_dmarc" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "TXT"
  name   = "_dmarc.jbeard.dev."
  value  = "v=DMARC1; p=reject;"
}

# For Migadu verification
resource "digitalocean_record" "jbeard_dev_migadu" {
  domain = digitalocean_domain.jbeard_dev.name
  type   = "TXT"
  name   = "@"
  value  = "hosted-email-verify=3zbtwhss"
}
