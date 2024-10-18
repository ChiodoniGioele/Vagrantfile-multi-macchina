#!/bin/bash

# Aggiorna il sistema
sudo apt-get update -y

# Installa MariaDB o MySQL
sudo apt-get install -y mariadb-server mariadb-client

# Configura MariaDB (disabilita l'accesso root remoto e crea un nuovo utente)
sudo mysql -e "UPDATE mysql.user SET Password=PASSWORD('root_password') WHERE User='root';"
sudo mysql -e "DELETE FROM mysql.user WHERE User='';"
sudo mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost');"
sudo mysql -e "FLUSH PRIVILEGES;"

# Crea un nuovo utente non-root per il database e un database
sudo mysql -e "CREATE DATABASE flask_db;"
sudo mysql -e "CREATE USER 'flask_user'@'%' IDENTIFIED BY 'flask_password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON flask_db.* TO 'flask_user'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Modifica la configurazione di MariaDB per permettere connessioni remote
sudo sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# Riavvia MariaDB
sudo systemctl restart mariadb
