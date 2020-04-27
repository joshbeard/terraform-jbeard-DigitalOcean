#
# DigitalOcean DNS for joshbeard.me
#

# Create a new domain
resource "digitalocean_domain" "joshbeard_me" {
  name       = "joshbeard.me"
}

resource "digitalocean_record" "joshbeard_me_a" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "A"
  name   = "@"
  value  = digitalocean_floating_ip.pine.ip_address
}

resource "digitalocean_record" "joshbeard_me_wildcard" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "CNAME"
  name   = "*.joshbeard.me."
  value  = "joshbeard.me."
}

# Add a record to the domain
#resource "digitalocean_record" "joshbeard_me_ns1" {
#  domain = digitalocean_domain.joshbeard_me.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns1.digitalocean.com."
#}
#
#resource "digitalocean_record" "joshbeard_me_ns2" {
#  domain = digitalocean_domain.joshbeard_me.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns2.digitalocean.com."
#}
#
#resource "digitalocean_record" "joshbeard_me_ns3" {
#  domain = digitalocean_domain.joshbeard_me.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns3.digitalocean.com."
#}

resource "digitalocean_record" "joshbeard_me_keybase" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "TXT"
  name   = "@"
  value  = "keybase-site-verification=DCBFW1VwtOcrdnGbDKrcsthPHZtSCth1mWx0oUE-SS4"
}

# ------------------------------------------------------------------------------
# Mail
# ------------------------------------------------------------------------------

resource "digitalocean_record" "joshbeard_me_mx1" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "MX"
  name   = "@"
  value  = "aspmx1.migadu.com."
  priority = "10"
}

resource "digitalocean_record" "joshbeard_me_mx2" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "MX"
  name   = "@"
  value  = "aspmx2.migadu.com."
  priority = "20"
}

resource "digitalocean_record" "joshbeard_me_spf" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:spf.migadu.com -all"
}

resource "digitalocean_record" "joshbeard_me_dkim" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "TXT"
  name   = "default._domainkey.joshbeard.me."
  value  = "v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwLut0Bap/mh3HE2rDPchHVrEcaKAfE1X5/k+7fBiIdRgk8GFoMiG3WpbaWygLS0Hw03ZjdeiIPQW/bfB7tz88NIwhIlq4VI2w+oBjF9pciLgzu0gFRGEC1KdRjn7M3YD/KTURS9kAAkgLKFWXqrUsuhuM00mZQn72MA/N9DSPfwIDAQAB"
}

resource "digitalocean_record" "joshbeard_me_dkim1" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "CNAME"
  name   = "key1._domainkey.joshbeard.me."
  value  = "key1.joshbeard.me._domainkey.migadu.com."
}

resource "digitalocean_record" "joshbeard_me_dkim2" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "CNAME"
  name   = "key2._domainkey.joshbeard.me."
  value  = "key2.joshbeard.me._domainkey.migadu.com."
}

resource "digitalocean_record" "joshbeard_me_dkim3" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "CNAME"
  name   = "key3._domainkey.joshbeard.me."
  value  = "key3.joshbeard.me._domainkey.migadu.com."
}

# DMARC
resource "digitalocean_record" "joshbeard_me_dmarc" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "TXT"
  name   = "_dmarc.joshbeard.me."
  value  = "v=DMARC1; p=reject;"
}

# For Migadu verification
resource "digitalocean_record" "joshbeard_me_migadu" {
  domain = digitalocean_domain.joshbeard_me.name
  type   = "TXT"
  name   = "@"
  value  = "hosted-email-verify=d1wmwhle"
}