#
# DigitalOcean DNS for hewbert.com
#

# Create a new domain
resource "digitalocean_domain" "hewbert_com" {
  name       = "hewbert.com"
}

resource "digitalocean_record" "hewbert_com_a" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "A"
  name   = "@"
  value  = digitalocean_floating_ip.pine.ip_address
}

resource "digitalocean_record" "hewbert_com_home_a" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "A"
  name   = "home"
  value  = "76.25.145.172"
}

resource "digitalocean_record" "hewbert_com_wildcard" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "CNAME"
  name   = "*.hewbert.com."
  value  = "hewbert.com."
}

# Add a record to the domain
#resource "digitalocean_record" "hewbert_com_ns1" {
#  domain = digitalocean_domain.hewbert_com.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns1.digitalocean.com."
#}
#
#resource "digitalocean_record" "hewbert_com_ns2" {
#  domain = digitalocean_domain.hewbert_com.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns2.digitalocean.com."
#}
#
#resource "digitalocean_record" "hewbert_com_ns3" {
#  domain = digitalocean_domain.hewbert_com.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns3.digitalocean.com."
#}

resource "digitalocean_record" "hewbert_com_mx1" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "MX"
  name   = "@"
  value  = "aspmx1.migadu.com."
  priority = "10"
}

resource "digitalocean_record" "hewbert_com_mx2" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "MX"
  name   = "@"
  value  = "aspmx2.migadu.com."
  priority = "20"
}

resource "digitalocean_record" "hewbert_com_spf" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:spf.migadu.com -all"
}

resource "digitalocean_record" "hewbert_com_dkim" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "TXT"
  name   = "default._domainkey.hewbert.com."
  value  = "v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwLut0Bap/mh3HE2rDPchHVrEcaKAfE1X5/k+7fBiIdRgk8GFoMiG3WpbaWygLS0Hw03ZjdeiIPQW/bfB7tz88NIwhIlq4VI2w+oBjF9pciLgzu0gFRGEC1KdRjn7M3YD/KTURS9kAAkgLKFWXqrUsuhuM00mZQn72MA/N9DSPfwIDAQAB"
}

resource "digitalocean_record" "hewbert_com_keybase" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "TXT"
  name   = "@"
  value  = "keybase-site-verification=wmUo6I0z2m0qMQmXxAv3s79b1cEJJbpdhboXEMmLRZs"
}

resource "digitalocean_record" "hewbert_com_dkim1" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "CNAME"
  name   = "key1._domainkey.hewbert.com."
  value  = "key1.hewbert.com._domainkey.migadu.com."
}

resource "digitalocean_record" "hewbert_com_dkim2" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "CNAME"
  name   = "key2._domainkey.hewbert.com."
  value  = "key2.hewbert.com._domainkey.migadu.com."
}

resource "digitalocean_record" "hewbert_com_dkim3" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "CNAME"
  name   = "key3._domainkey.hewbert.com."
  value  = "key3.hewbert.com._domainkey.migadu.com."
}

# DMARC
resource "digitalocean_record" "hewbert_com_dmarc" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "TXT"
  name   = "_dmarc.hewbert.com."
  value  = "v=DMARC1; p=reject;"
}

# For Migadu verification
resource "digitalocean_record" "hewbert_com_migadu" {
  domain = digitalocean_domain.hewbert_com.name
  type   = "TXT"
  name   = "@"
  value  = "hosted-email-verify=t9xijg68"
}