# Provisioning for Yodeling Octopus Server on Hetzner Cloud

## DNS Note

DNS can be tricky.... local caches in particular. on OSX: 

sudo killall -HUP mDNSResponder

server side (but likely not the issue)

sudo systemd-resolve --flush-caches