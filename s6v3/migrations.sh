#!/command/with-contenv sh

# run migrations
/var/www/html/bin/console doctrine:migrations:migrate --no-interaction
# fix file permissions for symfony cache
chown -R www-data:www-data /var/www/html/var
