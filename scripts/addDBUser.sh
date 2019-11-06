read -p 'DB name : ' dbname
read -p 'admin user name : ' adminusername
read -p 'admin user password : ' adminuserpassword
read -p 'standard user name : ' standardusername
read -p 'standard user password : ' standarduserpassword

commands="
CREATE DATABASE $dbname;
CREATE USER $adminusername@'%' IDENTIFIED BY '$adminuserpassword';
GRANT USAGE, EXECUTE, SELECT, SHOW VIEW, ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, CREATE VIEW, DELETE, INDEX, INSERT, REFERENCES, TRIGGER, UPDATE ON $dbname.* TO '$adminusername'@'%';
CREATE USER $standardusername@'%' IDENTIFIED BY '$standarduserpassword';
GRANt USAGE, SELECT, DELETE, INSERT, UPDATE ON $dbname.* TO '$standardusername'@'%';
FLUSH PRIVILEGES;"

echo "${commands}" | /usr/bin/mysql -u root -p