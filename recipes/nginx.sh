if aptitude search '~i ^nginx$' | grep -q nginx; then
  echo "nginx already installed, skipping."
else
  add-apt-repository ppa:nginx/stable --yes
  apt-get -y update
  apt-get -y install nginx

  mkdir -p /var/www/html/ffars/public
  chown -R root:root /var/www/html/ffars/public/
  chmod 755 /var/www
  mv files/nginx.conf /etc/nginx/sites-available/ffars

  sudo ln -s /etc/nginx/sites-available/ffars /etc/nginx/sites-enabled/ffars
  echo 'Webserver provisioned by sunzi is working' > /var/www/html/ffars/public/index.html
  service nginx restart
fi
