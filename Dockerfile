# Dockerfile para la web NFSU


FROM php:8.2-apache

# Copia el contenido de la carpeta web al directorio raíz de Apache
COPY ./web /var/www/html/web
# Copia index.php a la raíz para redirección automática
COPY ./web/index.php /var/www/html/index.php

# Configura ServerName para evitar advertencia
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && chown -R www-data:www-data /var/www/html/web /var/www/html/index.php \
    && chmod -R 755 /var/www/html/web /var/www/html/index.php

# Exponer el puerto 80
EXPOSE 80

# Instrucción de inicio
CMD ["apache2-foreground"]
