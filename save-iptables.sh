sudo apt-get -y install iptables-persistent

# For old systems
sudo /etc/init.d/iptables-persistent save 
sudo /etc/init.d/iptables-persistent reload

# For new systems
sudo netfilter-persistent save
sudo netfilter-persistent reload
