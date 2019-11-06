
##GITHUB
[Lien Git](https://github.com/BergmannFlorian/webservunix)

## VERSION
Debian 10.1

## VM config
__NAT network :__ ens32  
__bridged newtwork card :__ ens34

## VM users
__Name root :__ root  
__Mdp :__ WTP666cbx  

__Name user :__ Nimda  
__Mdp :__ WTP666cbx  

## Informations Réseaux :
__Type :__ NAT  
__Server Name :__ cornflakes  
__Card NAT Config :__ iface ens32 inet dhcp  
__Card Bridged Config :__ iface ens34 inet static  
- address 10.229.42.31
- netmask 255.255.240.0
- network 10.229.42.0
- broadcast 10.229.42.255
- gateway 10.229.32.1
- dns-nameservers 10.229.28.22 10.229.28.2
- dns-domain cpnv.ch
- dns-search cpnv.ch

## Paquest installés  
`apt update`  
`apt upgrade`  
ufw  
`apt-get install ufw`  
ports ouverts: 80, 443, 22, 3306  
`ufw allow 80`  
`ufw allow 443`  
`ufw allow 22`  
`ufw allow 3306`  
fail2ban  
`apt-get install fail2ban`  
sudo  
`apt-get install sudo`  
tous le droits sudo à nimda  
`nimda  ALL=(ALL:ALL) ALL`  

## Config ssh  
`apt-get install openssh-server`  
Ajouter la clé publique dans le fichier `~/.ssh/authorized_keys`  
Modifier le fichier `/etc/ssh/sshd_config` et configurer les paramètres suivants:  
- `PubkeyAuthentification` -> `yes`
- `PasswordAuthentification` -> `no`  

Redémarrer le serveur ssh. `systemctl restart ssh`  
.mdp clé privée: "WTP666cbx"

## MariaDb Config
__Install :__ 
$apt-get install mariadb-server -y

__Config :__  
$mysql_secure_config  
Change root password : no  
Remove anonymous user : yes  
Disallow root login remotely : yes  
Remove test database ... : yes  
Reload privilege table now : yes

`vim /etc/mysql/mariadb.conf.d/50-server.cnf`  
$nano /etc/mysql/mariadb.conf.d/50-server.cnf  
__Mettre les lignes suivantes en commentaire :__

`#skip-external-locking`

`#bind-address            = 127.0.0.1`

__Ajout d'utilisateur :__

`#mariadb`

`#CREATE USER maria@'%' IDENTIFIED BY 'WTP666cbx';`
_Redémarer le serveur_

__Création script :__  
`cd /home/nimda`  
`touch addDB.sh`  
`vim addDB.sh`  
_Inclure le contenu de scripts/addDB.sh et enregistrer_