# Install php and required modules
if apt search '~i ^php7.2$' | grep -q php; then
  echo "php already installed, skipping."
else
  apt-get install software-properties-common --yes
  add-apt-repository ppa:ondrej/php
  apt-get update -y
  apt-get install php7.2 php7.2-bcmath php7.2-gd  php7.2-fpm php7.2-pdo php7.2-pdo-pgsql php7.2-pgsql php7.2-mbstring php7.2-tokenizer php7.2-curl php7.2-json php7.2-xml php7.2-zip -y
fi
