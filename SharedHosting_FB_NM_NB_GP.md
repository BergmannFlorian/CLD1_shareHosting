# VM



compte nimda
mdp: WTP666cbx  
compte root  
mdp: WTP666cbx  

install  
1 NAT network
1 bridged newtwork card - 10.229.42.31
all base parameters  
server name: cornflakes

iface eth0 inet static
    address 10.0.0.41
    netmask 255.255.255.0
    network 10.0.0.0
    broadcast 10.0.0.255
    gateway 10.0.0.1
    dns-nameservers 10.0.0.1 8.8.8.8
    dns-domain acme.com
    dns-search acme.com