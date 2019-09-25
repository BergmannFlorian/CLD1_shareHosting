# VM



compte nimda
mdp: WTP666cbx  
compte root  
mdp: WTP666cbx  

install  
1 NAT network
1 bridged newtwork card - 10.229.42.31 255.255.240.0
all base parameters  
server name: cornflakes


test
iface eth0 inet static
    address 10.229.42.31
    netmask 255.255.240.0
    network 10.229.42.0
    broadcast 10.229.42.255
    gateway 10.229.32.1
    dns-nameservers 10.229.28.22 10.229.28.2
    dns-domain cpnv.ch
    dns-search cpnv.ch

#### DOCUMENTATION EXTERNE

---
[Synthaxe Markdown](https://markdown-it.github.io/)
