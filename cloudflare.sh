iptables -A INPUT -p tcp -m multiport --dports http,https -j DROP
ip6tables -A INPUT -p tcp -m multiport --dports http,https -j DROP

for i in `curl https://www.cloudflare.com/ips-v4`; do iptables -I INPUT -p tcp -m multiport --dports http,https -s $i -j ACCEPT; done
for i in `curl https://www.cloudflare.com/ips-v6`; do ip6tables -I INPUT -p tcp -m multiport --dports http,https -s $i -j ACCEPT; done
