terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.46.1"
    }
    hetznerdns = {
      source = "timohirt/hetznerdns"
      version = "2.2.0"
    }
  }
}

provider "hcloud" {
  token = var.hetzner_cloud_api_token
}

provider "hetznerdns" {
  apitoken = var.hetzner_cloud_dns_token
}


resource "hcloud_firewall" "web_server_and_ssh" {
  name = "Standard Web Ports and SSH"

  rule {
    description = "Allow HTTP traffic"
    direction   = "in"
    protocol    = "tcp"
    port        = "80"
    source_ips  = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    description = "Allow HTTPS traffic"
    direction   = "in"
    protocol    = "tcp"
    port        = "443"
    source_ips  = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    description = "Allow SSH traffic"
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips  = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

resource "hcloud_network" "hood" {
  name     = "The hood"
  ip_range = "10.0.1.0/16"
}

resource "hcloud_network_subnet" "corner_se" {
  network_id   = hcloud_network.hood.id
  type         = "cloud"
  ip_range     = "10.0.1.0/24"
  network_zone = "eu-central"
}

data "hcloud_ssh_key" "stash" {
  name = "stash"
}

resource "hcloud_server" "stage" {
  name         = "stage"
  server_type  = "cx22"
  location     = "nbg1"
  image        = "docker-ce"
  ssh_keys     = [data.hcloud_ssh_key.stash.id]
  firewall_ids = [hcloud_firewall.web_server_and_ssh.id]

  network {
    network_id = hcloud_network.hood.id
  }

  depends_on = [hcloud_network_subnet.corner_se]
}

