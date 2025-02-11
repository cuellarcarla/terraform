#!/bin/bash

# Actualizar e instalar MySQL Server
sudo apt update
sudo apt install -y mysql-server

# Configurar la base de datos y el usuario
sudo mysql -e "CREATE DATABASE IF NOT EXISTS ${db_name};"
sudo mysql -e "CREATE USER IF NOT EXISTS '${db_username}'@'%' IDENTIFIED BY '${db_password}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_username}'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Configurar MySQL para aceptar conexiones desde cualquier IP
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Reiniciar MySQL y habilitarlo para que inicie al arrancar
sudo systemctl restart mysql
sudo systemctl enable mysql

# Verificación de instalación
if sudo systemctl is-active --quiet mysql; then
  echo "MySQL se ha configurado y está en funcionamiento."
else
  echo "Error: MySQL no se ha iniciado correctamente."
  exit 1
fi
