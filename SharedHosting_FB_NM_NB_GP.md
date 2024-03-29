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

    apt update  
    apt upgrade
      
ufw  

    apt-get install ufw  
    
ports ouverts: 80, 443, 22, 3306  

    ufw allow 80  
    ufw allow 443  
    ufw allow 22  
    ufw allow 3306  
    
fail2ban  

    apt-get install fail2ban  
    
sudo  

    apt-get install sudo
    
tous le droits sudo à nimda  

    nimda  ALL=(ALL:ALL) ALL  

## Installation du Firewall
`apt-get install ufw`
 
 Ports ouverts: 80, 443, 22, 3306
 
    ufw allow 80  
    ufw allow 443
    ufw allow 22  
    ufw allow 3306  
    
##Installation du framework de prévention
- fail2ban
 
        apt-get install fail2ban

#Installation de sudo
    sudo apt-get install sudo
    
 Ouvrir le fichier de config avec
  
    visudo
 
 Tous le droits sudo à l'utilisateur nimda
  
    nimda ALL=(ALL:ALL) ALL  

Donner tous le droits sudo à nimda 
    
    nimda  ALL=(ALL:ALL) ALL

## Configuration ssh  

    apt-get install openssh-server
     
Ajouter la clé publique dans le fichier 

    ~/.ssh/authorized_keys
      
Modifier le fichier `/etc/ssh/sshd_config` et configurer les paramètres suivants:  
- `PubkeyAuthentification` -> `yes`
- `PasswordAuthentification` -> `no`  

Redémarrer le serveur ssh. 

    systemctl restart ssh
      
mdp actuel clé privée: "WTP666cbx"

## MariaDb Config
__Install :__ 
$apt-get install mariadb-server -y

__Config :__  
    
    mysql_secure_config
      
Change root password : no  
Remove anonymous user : yes  
Disallow root login remotely : yes  
Remove test database ... : yes  
Reload privilege table now : yes

    vim /etc/mysql/mariadb.conf.d/50-server.cnf

__Mettre les lignes suivantes en commentaire :__

`#skip-external-locking`  
`#bind-address = 127.0.0.1`

__Ajout d'utilisateur admin:__

    mariadb  
    CREATE USER maria@'%' IDENTIFIED BY 'WTP666cbx';
    
_Redémarer le serveur_


__Création script :__  

    cd /home/nimda 
    touch addUser.sh  
    vim addUser.sh
    
_Inclure le contenu de scripts/addUser.sh et enregistrer_

Le script de création d'un nouveau user + db + apache se trouve dans le fichier addUser.sh fournit en annexe

###Installation de PHP-FPM
Installer le service :
    
    sudo apt install php-fpm

###Mise en place de Nginx

####- Installation

Procédez aux commandes ci-dessous :
    
    sudo apt install nginx
    
####- Paramètrage du par-feu

    sudo ufw allow 'Nginx HTTP'
    
####- Vérifier le fonctionnement du server

    systemctl status nginx
    
Cette commande doit vous retourner une présentation du service nginx en cours

Pour accéder à votre server depuis un navigateur, pointez vers son ip

Verifiez votre ip :

    ip addr show "interface" | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
    
Changez le "interface" par l'interface principale de votre machine

Faite la commande suivante pour trouver le nom de votre interface

    ip a

Remplacez le "interface" de la commande précédente par le nom de votre interface en ligne

Accédez à votre site en tappant son ip dans la barre d'un navigateur

####- Gérer le fonctionnement du server
Stopper le server :

    systemctl stop nginx
    
Start le server :

    systemctl start nginx
    
Restart le server :

    systemctl restart nginx
    
Réalisez des configurations sans perdre les connections :

    systemctl reload nginx
           

###Ajouter un site web
Les informations placées entre les crochets [  ] vous sont propres.

###Créer un utilisateur

Lancez le script addUser.sh

#### Ajouter l'utilisateur wwww-data au groupe du nouvel utilisateur
    
    sudo usermod -a -G [nomutilisateur] www-data
    
l'utilisateur concerné est celui indiqué lors du lancement du script addUser.sh

####Créer le fichier de configuration
Accéder au dossier /etc/ningx/sites-available/

    cd /etc/ningx/sites-available/
    touch [nomsite.conf]
    
Ajoutez les informations suivante dans le fichier :

    sudo vim [nomsite.conf]
    
Copiez les informations ci-dessous :

    - server {
         listen 80;
         listen [::]:80;
      
         root /home/nomutilisateur/[nomsite.com];
      
         index index.html;
      
         server_name [nomsite.com] www.[nomsite.com];
      
         location / {
           try_files $uri $uri/ =404;
         }
       }
    
       
####Création du symlink
Pour permettre à votre site de fonctionner, réalisez un lien :

    - sudo ln -s  /etc/nginx/sites-available/[nomdusite.conf] /etc/nginx/sites-enabled/[nomdusite.conf]
    
####Finalisation et permissions
Mettez en place le dossier du site nomdusite.com dans /home/nomutilisateur/

    - sudo chown -R nomutilisateur /home/[nomutilisateur]
    
Connectez-vous avec l'utilisateur concerné
    
    -su [nomutilisateur]
    
Changez les permissions du dossier concerné
    
    - sudo chmod -R 750 /home/[nomutilisateur]
   
Redémarrez votre server nginx

    - systemctl restart nginx
    
Votre site est désormais disponible

###Isolation
L'isolation des utilisateurs est réalisée grâce à la gestion des permissions sur leur dossier /home/nomutilisateur  
L'attribution de la propriété du dossier est faite pour l'utilisateur concerné,   
Ensuite l'utilisateur concerné doit changer les droits de son dossier afin qu'il ait le droit de lecture, écriture et éxecution.
Les droits doivent être fixés en lecture et exécution pour le groupe de l'utilisateur.  
Les droits pour tout les autres doivent être nuls.

En ce qui concerne l'isolation de la base de donnée, elle est réalisée grâce aux droits appliqués dans le script addUser.sh  
Le droit "USAGE" sur une db ne permet d'avoir accès qu'à celle-ci.

Lors de l'ajout d'un site, il faut reprendre les étapes de la section "Ajouter un site web"
Pour avoir plusieurs sites de disponible au sein du serveur, il vous faudra configurer vos nom de domaines.
Pour tester la disponibilité des sites sans nom de domaine, vous pouvez modifier le fichier "host" de votre ordinateur et y ajouter les informations comme ci-dessous :
        
        10.229.42.31 site1.com
        10.229.42.31 site2.com
       
 Remplacez l'adresse ip par l'adresse de votre server.
 


##Concernés
Pereira Gabriel  
Maitre Nicolas  
Bergmann Florian  
Berdoz Noé  
SI-T1a