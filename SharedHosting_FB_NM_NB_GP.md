## VM config
1 NAT network ->  ens32  
1 bridged newtwork card -> ens34

## VM install
compte root  
mdp: WTP666cbx 
compte nimda
mdp: WTP666cbx  

all base parameters
server name: cornflakes


## Config network
- iface ens32 inet dhcp
- iface ens34 inet static
    - address 10.229.42.31
    - netmask 255.255.240.0
    - network 10.229.42.0
    - broadcast 10.229.42.255
    - gateway 10.229.32.1
    - dns-nameservers 10.229.28.22 10.229.28.2
    - dns-domain cpnv.ch
    - dns-search cpnv.ch