#
# DigitalOcean DNS for signaltotrust.net
#

# Create a new domain
resource "digitalocean_domain" "signaltotrust_net" {
  name       = "signaltotrust.net"
}

resource "digitalocean_record" "signaltotrust_net_a" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "A"
  name   = "@"
  value  = digitalocean_floating_ip.pine.ip_address
}

resource "digitalocean_record" "signaltotrust_net_wildcard" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "CNAME"
  name   = "*.signaltotrust.net."
  value  = "signaltotrust.net."
}

# Add a record to the domain
#resource "digitalocean_record" "signaltotrust_net_ns1" {
#  domain = digitalocean_domain.signaltotrust_net.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns1.digitalocean.com."
#}
#
#resource "digitalocean_record" "signaltotrust_net_ns2" {
#  domain = digitalocean_domain.signaltotrust_net.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns2.digitalocean.com."
#}
#
#resource "digitalocean_record" "signaltotrust_net_ns3" {
#  domain = digitalocean_domain.signaltotrust_net.name
#  type   = "NS"
#  name   = "@"
#  value  = "ns3.digitalocean.com."
#}

resource "digitalocean_record" "signaltotrust_net_mx1" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "MX"
  name   = "@"
  value  = "aspmx1.migadu.com."
  priority = "10"
}

resource "digitalocean_record" "signaltotrust_net_mx2" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "MX"
  name   = "@"
  value  = "aspmx2.migadu.com."
  priority = "20"
}

resource "digitalocean_record" "signaltotrust_net_spf" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:spf.migadu.com -all"
}

resource "digitalocean_record" "signaltotrust_net_dkim" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "TXT"
  name   = "default._domainkey.signaltotrust.net."
  value  = "v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDfa3IQimbbUyyhUlx6Fa8erWgqYICetFbURdQRFSvaldhi2R64nkSEW2k0ECl0gDB3k+DM2DeFcR06YSU7e8ogh5xae88TEc398mNpjz//ATeX/5WixhViM9RWoYdT07Ueql3qv/OKOCPsfqL6Enng6UGrZ9pws6DDj4dpQz1wywIDAQAB"
}

resource "digitalocean_record" "signaltotrust_net_dkim1" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "CNAME"
  name   = "key1._domainkey.signaltotrust.net."
  value  = "key1.signaltotrust.net._domainkey.migadu.com."
}

resource "digitalocean_record" "signaltotrust_net_dkim2" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "CNAME"
  name   = "key2._domainkey.signaltotrust.net."
  value  = "key2.signaltotrust.net._domainkey.migadu.com."
}

resource "digitalocean_record" "signaltotrust_net_dkim3" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "CNAME"
  name   = "key3._domainkey.signaltotrust.net."
  value  = "key3.signaltotrust.net._domainkey.migadu.com."
}

# DMARC
resource "digitalocean_record" "signaltotrust_net_dmarc" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "TXT"
  name   = "_dmarc.signaltotrust.net."
  value  = "v=DMARC1; p=reject;"
}

# For Migadu verification
resource "digitalocean_record" "signaltotrust_net_migadu" {
  domain = digitalocean_domain.signaltotrust_net.name
  type   = "TXT"
  name   = "@"
  value  = "hosted-email-verify=i5smtvsc"
}