#!/bin/bash
#LINUX user
read -p 'standard user name : ' standardusername
read -s -p 'standard user password : ' standarduserpassword

useradd "$standardusername" --password $(mkpasswd -H md5 $standarduserpassword)

#DB user
read -p 'DB name : ' dbname
read -p 'admin user name : ' adminusername
read -s -p 'admin user password : ' adminuserpassword

commands="
CREATE DATABASE $dbname;
CREATE USER $adminusername@'%' IDENTIFIED BY '$adminuserpassword';
GRANT USAGE, EXECUTE, SELECT, SHOW VIEW, ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, CREATE VIEW, DELETE, INDEX, INSERT, REFERENCES, TRIGGER, UPDATE ON $dbname.* TO '$adminusername'@'%';
CREATE USER $standardusername@'%' IDENTIFIED BY '$standarduserpassword';
GRANt USAGE, SELECT, DELETE, INSERT, UPDATE ON $dbname.* TO '$standardusername'@'%';
FLUSH PRIVILEGES;"

echo "${commands}" | /usr/bin/mysql -u root -p