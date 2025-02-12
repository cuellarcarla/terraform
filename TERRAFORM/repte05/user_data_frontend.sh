#!/bin/bash
sudo apt update
sudo apt install -y apache2 php php-mysql nfs-common

# Crear el directorio de montaje
sudo mkdir -p /var/www/html

# Montar el sistema de archivos EFS
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${efs_dns_name}:/ /var/www/html

# Verificar si el montaje fue exitoso
if mountpoint -q /var/www/html; then
  echo "Montaje de EFS exitoso"
  sudo chown -R www-data:www-data /var/www/html
else
  echo "Error: no se pudo montar EFS"
  exit 1
fi

# Reiniciar Apache y habilitarlo para que inicie al arrancar
sudo systemctl restart apache2
sudo systemctl enable apache2
