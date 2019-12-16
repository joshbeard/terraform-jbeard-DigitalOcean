#
# DigitalOcean DNS for juliabeard.me
#

# Create a new domain
resource "digitalocean_domain" "juliabeard_me" {
  name       = "juliabeard.me"
}

resource "digitalocean_record" "juliabeard_me_a" {
  domain = digitalocean_domain.juliabeard_me.name
  type   = "A"
  name   = "@"
  value  = digitalocean_floating_ip.pine.ip_address
}

resource "digitalocean_record" "juliabeard_me_wildcard" {
  domain = digitalocean_domain.juliabeard_me.name
  type   = "CNAME"
  name   = "*.juliabeard.me."
  value  = "juliabeard.me."
}

# Add a record to the domain
#resource "digitalocean_record" "juliabeard_me_ns1" {
#  domain = digitalocean_domain.juliabeard_me.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns1.digitalocean.com."
#}
#
#resource "digitalocean_record" "juliabeard_me_ns2" {
#  domain = digitalocean_domain.juliabeard_me.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns2.digitalocean.com."
#}
#
#resource "digitalocean_record" "juliabeard_me_ns3" {
#  domain = digitalocean_domain.juliabeard_me.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns3.digitalocean.com."
#}

resource "digitalocean_record" "juliabeard_me_mx1" {
  domain = digitalocean_domain.juliabeard_me.name
  type   = "MX"
  name   = "@"
  value  = "aspmx1.migadu.com."
  priority = "10"
}

resource "digitalocean_record" "juliabeard_me_mx2" {
  domain = digitalocean_domain.juliabeard_me.name
  type   = "MX"
  name   = "@"
  value  = "aspmx2.migadu.com."
  priority = "20"
}

resource "digitalocean_record" "juliabeard_me_spf" {
  domain = digitalocean_domain.juliabeard_me.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 a mx include:spf.migadu.com ~all"
}

resource "digitalocean_record" "juliabeard_me_dkim" {
  domain = digitalocean_domain.juliabeard_me.name
  type   = "TXT"
  name   = "default._domainkey.juliabeard.me."
  value  = "v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDfa3IQimbbUyyhUlx6Fa8erWgqYICetFbURdQRFSvaldhi2R64nkSEW2k0ECl0gDB3k+DM2DeFcR06YSU7e8ogh5xae88TEc398mNpjz//ATeX/5WixhViM9RWoYdT07Ueql3qv/OKOCPsfqL6Enng6UGrZ9pws6DDj4dpQz1wywIDAQAB"
}

resource "digitalocean_record" "juliabeard_me_dmarc" {
  domain = digitalocean_domain.juliabeard_me.name
  type   = "TXT"
  name   = "_dmarc.juliabeard.me."
  value  = "v=DMARC1; p=none; fo=1; rua=mailto:admin@juliabeard.me"
}