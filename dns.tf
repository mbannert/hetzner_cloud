data "hetznerdns_zone" "zone1" {
  name = "yodeling-octopus.net"
}

resource "hetznerdns_record" "a_root" {
  name     = "@"
  type     = "A"
  value    = var.public_ip
  ttl      = 60
  zone_id  = data.hetznerdns_zone.zone1.id
}

resource "hetznerdns_record" "a_www" {
  name     = "www"
  type     = "A"
  value    = var.public_ip
  ttl      = 60
  zone_id  = data.hetznerdns_zone.zone1.id
}

resource "hetznerdns_record" "a_api" {
  name     = "api"
  type     = "A"
  value    = var.public_ip
  ttl      = 60
  zone_id  = data.hetznerdns_zone.zone1.id
}

resource "hetznerdns_record" "aaaa_root" {
  name     = "@"
  type     = "AAAA"
  value    = "2a01:4f8:d0a:27bd::2"
  ttl      = 7200
  zone_id  = data.hetznerdns_zone.zone1.id
}

resource "hetznerdns_record" "aaaa_www" {
  name     = "www"
  type     = "AAAA"
  value    = "2a01:4f8:d0a:27bd::2"
  ttl      = 7200
  zone_id  = data.hetznerdns_zone.zone1.id
}

resource "hetznerdns_record" "ns1" {
  name     = "@"
  type     = "NS"
  value    = "ns3.second-ns.de"
  ttl      = 7200
  zone_id  = data.hetznerdns_zone.zone1.id
}

resource "hetznerdns_record" "ns2" {
  name     = "@"
  type     = "NS"
  value    = "ns.second-ns.com"
  ttl      = 7200
  zone_id  = data.hetznerdns_zone.zone1.id
}

resource "hetznerdns_record" "ns3" {
  name     = "@"
  type     = "NS"
  value    = "ns1.your-server.de"
  ttl      = 7200
  zone_id  = data.hetznerdns_zone.zone1.id
}

resource "hetznerdns_record" "soa" {
  name     = "@"
  type     = "SOA"
  value    = "ns1.your-server.de. postmaster.your-server.de. 2025012203 86400 10800 3600000 3600"
  ttl      = 7200
  zone_id  = data.hetznerdns_zone.zone1.id
}
