
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
##Avant de commencer :
`apt update`
`apt upgrade`

## Installation du Firewall
`apt-get install ufw`
 
 Ports ouverts: 80, 443, 22, 3306
 
    `ufw allow 80`  
    `ufw allow 443`
    `ufw allow 22`  
    `ufw allow 3306`  
    
##Installation du framework de prévention
- fail2ban `apt-get install fail2ban`

##Installation de sudo
`apt-get install sudo`

Donner tout le droits sudo à nimda 
    
`nimda  ALL=(ALL:ALL) ALL`

## Configuration ssh  
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

###Mise en place de Nginx
####- Installation

Procéder aux commandes ci-dessous :
    
    - sudo apt install nginx
    
####- Paramètrage du par-feu

    - sudo ufw allow 'Nginx HTTP'
    
####- Vérifier le fonctionnement du server

    - systemctl status nginx
    
Cette commande doit vous retourner une présentation du service nginx en cours

Pour accéder à votre server depuis un navigateur, pointez vers son ip

Verifier votre ip :

    -ip addr show "interface" | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
    
Changer le "interface" par l'interface principale de votre machine

Faite la commande suivante pour trouver le nom de votre interface

    - ip a

Remplacer le "interface" de la commande précédente par le nom de votre interface en ligne

Accéder à votre site en tappant son ip dans la barre d'un navigateur

####- Gérer le fonctionnement du server
Stopper le server :

    - sudo systemctl stop nginx
    
Start le server :

    - sudo systemctl start nginx
    
Restart le server :

    - sudo systemctl restart nginx
    
Réaliser des configurations sans perdre les connections :

    - sudo systemctl reload nginx
    
###Installation de PHP-FPM
Installer le service :
    
    - sudo apt install php-fpm