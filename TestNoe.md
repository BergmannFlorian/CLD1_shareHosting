##Notes de tests sur machine par Noé

####Apt-get install

- hot, permet d'afficher l'utilisation des ressources du server
- tree, affichage des hiérarchie des dossiers/fichiers de manière visuelle
- sudo, commande en root

###Configuration ssh
Amélioration de la sécurité :

Modifier "#PermitRootLogin: prohibit-passsword" -> "#PermitRootLogin: no"

- vim /etc/ssh/sshd_config
