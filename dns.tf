data "hetznerdns_zone" "zone1" {
  name = "yodeling-octopus.net"
}

resource "hetznerdns_record" "root" {
  zone_id = data.hetznerdns_zone.zone1.id
  name    = "@"
  value   = var.public_ip
  type    = "A"
  ttl     = 60
}


resource "hetznerdns_record" "www" {
  zone_id = data.hetznerdns_zone.zone1.id
  name    = "www"
  value   = var.public_ip
  type    = "A"
  ttl     = 60
}

resource "hetznerdns_record" "api" {
  zone_id = data.hetznerdns_zone.zone1.id
  name    = "api"
  value   = var.public_ip
  type    = "A"
  ttl     = 60
}


resource "hetznerdns_record" "ns1" {
  zone_id = data.hetznerdns_zone.zone1.id
  name    = "@"
  value   = "ns1.your-server.de."
  type    = "NS"
  ttl     = 60
}

resource "hetznerdns_record" "ns2" {
  zone_id = data.hetznerdns_zone.zone1.id
  name    = "@"
  value   = "ns.second-ns.com."
  type    = "NS"
  ttl     = 60
}

resource "hetznerdns_record" "ns3" {
  zone_id = data.hetznerdns_zone.zone1.id
  name    = "@"
  value   = "ns3.second-ns.de."
  type    = "NS"
  ttl     = 60
}


resource "hetznerdns_record" "aaaa_root" {
  zone_id = data.hetznerdns_zone.zone1.id
  name    = "@"
  value   = var.public_ip6
  type    = "AAAA"
  ttl     = 60
}


resource "hetznerdns_record" "aaaa_www" {
  zone_id = data.hetznerdns_zone.zone1.id
  name    = "www"
  value   = var.public_ip6
  type    = "AAAA"
  ttl     = 60
}

