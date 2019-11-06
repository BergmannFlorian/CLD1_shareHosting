##Notes de tests sur machine par Noé

##Intallation
    - apt update
    - apt upgrade

####Apt-get install

- htop, permet d'afficher l'utilisation des ressources du server
- tree, affichage des hiérarchie des dossiers/fichiers de manière visuelle
- sudo, commande en root

###Configuration ssh
Amélioration de la sécurité :

Modifier "#PermitRootLogin: prohibit-passsword" -> "#PermitRootLogin: no"

- vim /etc/ssh/sshd_config

###Déploiement avec Rsync

Commande permettant la synchronisation de dossier et le déploiement de données en évitant des doublons

-P : Permet le transfert de donnée avec une barre d'avancement et une prise en charge partielle en cas de problème réseaux

-z : Compression des fichiers pour une consommation moins forte en débit mais plus forte coté machine (compression / décompression)

-n : Dry Run, Affiche ce que la commande va faire sans l'exécuter

###Mise en place de Nginx
####- Installation

Procéder aux commandes ci-dessous :
    
    - sudo apt install nginx
    
####- Paramètrage du par-feu

    - sudo ufw allow 'Nginx HTTP'
    allow que http ? jsp
    
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
    
###Mise en place de plusieurs site sur le server
Modifier le fichier host présent sur l'ordinateur
C:\Windows\System32\drivers\etc
Ajouter 10.229.42.31 nomdusite.com

###Vidéo Grafikart avancement
Mise en place de Nginx

###Conseils Killian
Voir ce qu'est la configuration d'un socket en Nginx
Mettre le user nginx dans un groupe pour qu'il lisent les donnée avec les droits
avoir un dossier site en sous repertoire des dossiers utilisateurs

###Conseils Dylan
https://www.digitalocean.com/community/tutorials/how-to-host-multiple-websites-securely-with-nginx-and-php-fpm-on-ubuntu-14-04
Voir ce lien pour isolation etc

##DERNIERE FOIS 30 OCTOBRE FAIS
Création de plusieurs sites fonctionnels
Réaliser un markdown de toutes les actions à faire pour que flo crée un fichier bash avec