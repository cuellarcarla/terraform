#!/bin/bash
apt update -y
apt upgrade -y
apt install -y apache2 mysql-client php libapache2-mod-php php-mysql unzip wget

systemctl enable apache2
systemctl start apache2

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

cat > /var/www/html/wp-config.php <<EOL
<?php
define('DB_NAME', '${db_name}');
define('DB_USER', '${db_user}');
define('DB_PASSWORD', '${db_password}');
define('DB_HOST', '${db_host}');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
\$table_prefix = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') ) {
  define('ABSPATH', dirname(__FILE__) . '/');
}
require_once ABSPATH . 'wp-settings.php';
EOL

systemctl restart apache2
