#!/bin/bash

# Super-utilisateur
sudo -s;

# Configuration des dépots
rm /etc/apt/sources.list;
echo 'deb http://ftp.fr.debian.org/debian/ squeeze non-free main' >> /etc/apt/sources.list;
echo 'deb-src http://ftp.fr.debian.org/debian/ squeeze non-free main' >> /etc/apt/sources.list;
echo '' >> /etc/apt/sources.list
echo 'deb-src http://security.debian.org/ squeeze/updates main' >> /etc/apt/sources.list;
echo 'deb-src http://security.debian.org/ squeeze/updates main' >> /etc/apt/sources.list;
echo '' >> /etc/apt/sources.list
echo 'deb-src http://ftp.fr.debian.org/debian/ squeeze-updates main' >> /etc/apt/sources.list;
echo 'deb-src http://ftp.fr.debian.org/debian/ squeeze-updates main' >> /etc/apt/sources.list;

apt-get update;
apt-get upgarde;

apt-get install unzip;

# Telechargement de l'archive
cd;
wget https://nodeload.github.com/saidomar/ProgWeb/zipball/master;
unzip saidomar-ProgWeb-*;
cd saidomar-ProgWeb-*;

# Intallation base de données (mdp admin = toor)
apt-get install mysql-server;
mysql -u root -p < DB.sql;

# Installation Java
apt-get install sun-java-jdk;
echo 'JAVA_HOME="/usr/lib/jvm/java-6-sun"' >> /etc/environment;  
echo 'JRE_HOME="/usr/lib/jvm/java-6-sun/jre"' >> /etc/environment;

# Installation Tomcat
apt-get install tomcat6 tomcat6-admin;
service tomcat6 stop;

# Deploiement de l'application Web
mkdir /var/lib/tomcat6/webapps/ProgWeb;
cp -r ProgWeb/* /var/lib/tomcat6/webapps/ProgWeb/;

# Demarrage Tomcat
service tomcat6 start;
echo 'ATTENTION : Ne pas oublier de configurer l interface reseau de votre serveur'
echo 'WebApp at http://@ip_tomcat_sever:8080/ProgWeb/'