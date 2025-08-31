#!/bin/bash

# Exit on error and undefined variables
set -eu

# IPv4 rules
for ip in $(curl -s https://www.cloudflare.com/ips-v4); do
    iptables -I INPUT -p tcp -m multiport --dports http,https -s "$ip" -j ACCEPT
done

# IPv6 rules (only if IPv6 is enabled)
for ip in $(curl -s https://www.cloudflare.com/ips-v6); do
    ip6tables -I INPUT -p tcp -m multiport --dports http,https -s "$ip" -j ACCEPT
done

# Block all other HTTP/HTTPS traffic
iptables -A INPUT -p tcp -m multiport --dports http,https -j DROP
ip6tables -A INPUT -p tcp -m multiport --dports http,https -j DROP

echo "Cloudflare IPs whitelisted and other HTTP/S traffic blocked"
