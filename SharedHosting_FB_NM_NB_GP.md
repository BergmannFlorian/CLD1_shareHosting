
##GITHUB
[Lien Git](https://github.com/BergmannFlorian/webservunix)

## VERSION
Debian 10.1

## VM config
1 NAT network ->  ens32  
1 bridged newtwork card -> ens34

## VM INFO
__Informations Login :__

- __Id Admin :__ root
- __Mdp :__ WTP666cbx

- __Id :__ Nimda.
- __Mdp :__ WTP666cbx

__Informations Réseaux :__
- __Type :__ NAT
- __Server Name :__ cornflakes
- __Card NAT Config :__ iface ens32 inet dhcp
- __Card Bridged Config :__ iface ens34 inet static
    - address 10.229.42.31
    - netmask 255.255.240.0
    - network 10.229.42.0
    - broadcast 10.229.42.255
    - gateway 10.229.32.1
    - dns-nameservers 10.229.28.22 10.229.28.2
    - dns-domain cpnv.ch
    - dns-search cpnv.ch


# DOCUMENTATION EXTERNE
[Synthaxe Markdown](https://markdown-it.github.io/)