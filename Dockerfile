# Selecionar imagem do Yii com php 7.1 e Composer
FROM yiisoftware/yii2-php:8.3-apache-latest
# Atualizar repositorio
RUN apt update && apt install nano -y
# Acessar diretório
WORKDIR /app
# Ative o arquivo httpd.conf para alterar o diretório público
#COPY httpd.conf /etc/apache2/sites-enabled/httpd.conf
#COPY httpd.conf /etc/apache2/sites-available/httpd.conf

# Instalar Yii2
RUN composer create-project --prefer-dist --no-interaction yiisoft/yii2-app-basic /app/

# Instalar depedências do composer
RUN composer install --no-scripts

# Adicionar permissões para o usuário apache
RUN chown -R www-data:www-data /app