#!/bin/bash
read -p 'standard user name : ' standardusername
read -s -p 'standard user password : ' standarduserpassword

#adds a linux user
useradd "$standardusername" --password $(mkpasswd -H md5 $standarduserpassword)