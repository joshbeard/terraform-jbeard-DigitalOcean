# Create a new domain
resource "digitalocean_domain" "jbeard_org" {
  name       = "jbeard.org"
}

resource "digitalocean_record" "jbeard_org_a" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "A"
  name   = "@"
  value  = digitalocean_floating_ip.pine.ip_address
}

resource "digitalocean_record" "jbeard_org_home_a" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "A"
  name   = "home"
  value  = "76.25.145.172"
}

resource "digitalocean_record" "jbeard_org_wildcard" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "CNAME"
  name   = "*.jbeard.org."
  value  = "jbeard.org."
}

resource "digitalocean_record" "jbeard_org_t" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "CNAME"
  name   = "t.jbeard.org."
  value  = "home.jbeard.org."
}

resource "digitalocean_record" "jbeard_org_plex" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "CNAME"
  name   = "plex.jbeard.org."
  value  = "home.jbeard.org."
}

# Add a record to the domain
#resource "digitalocean_record" "jbeard_org_ns1" {
#  domain = digitalocean_domain.jbeard_org.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns1.digitalocean.com."
#}
#
#resource "digitalocean_record" "jbeard_org_ns2" {
#  domain = digitalocean_domain.jbeard_org.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns2.digitalocean.com."
#}
#
#resource "digitalocean_record" "jbeard_org_ns3" {
#  domain = digitalocean_domain.jbeard_org.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns3.digitalocean.com."
#}

resource "digitalocean_record" "jbeard_org_mx1" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "MX"
  name   = "@"
  value  = "aspmx1.migadu.com."
  priority = "10"
}

resource "digitalocean_record" "jbeard_org_mx2" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "MX"
  name   = "@"
  value  = "aspmx2.migadu.com."
  priority = "20"
}

# SPF
resource "digitalocean_record" "jbeard_org_spf" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:spf.migadu.com -all"
}

# DKIM
resource "digitalocean_record" "jbeard_org_dkim" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "TXT"
  name   = "default._domainkey.jbeard.org."
  value  = "v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwLut0Bap/mh3HE2rDPchHVrEcaKAfE1X5/k+7fBiIdRgk8GFoMiG3WpbaWygLS0Hw03ZjdeiIPQW/bfB7tz88NIwhIlq4VI2w+oBjF9pciLgzu0gFRGEC1KdRjn7M3YD/KTURS9kAAkgLKFWXqrUsuhuM00mZQn72MA/N9DSPfwIDAQAB"
}

resource "digitalocean_record" "jbeard_org_dkim1" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "CNAME"
  name   = "key1._domainkey.jbeard.org."
  value  = "key1.jbeard.org._domainkey.migadu.com."
}

resource "digitalocean_record" "jbeard_org_dkim2" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "CNAME"
  name   = "key2._domainkey.jbeard.org."
  value  = "key2.jbeard.org._domainkey.migadu.com."
}

resource "digitalocean_record" "jbeard_org_dkim3" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "CNAME"
  name   = "key3._domainkey.jbeard.org."
  value  = "key3.jbeard.org._domainkey.migadu.com."
}

# DMARC
resource "digitalocean_record" "jbeard_org_dmarc" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "TXT"
  name   = "_dmarc.jbeard.org."
  value  = "v=DMARC1; p=reject;"
}

# Keybase verification
resource "digitalocean_record" "jbeard_org_keybase" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "TXT"
  name   = "@"
  value  = "keybase-site-verification=wmUo6I0z2m0qMQmXxAv3s79b1cEJJbpdhboXEMmLRZs"
}

# For Migadu verification
resource "digitalocean_record" "jbeard_org_migadu" {
  domain = digitalocean_domain.jbeard_org.name
  type   = "TXT"
  name   = "@"
  value  = "hosted-email-verify=mvqyprbr"
}
