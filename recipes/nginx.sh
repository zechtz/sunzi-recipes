if aptitude search '~i ^nginx$' | grep -q nginx; then
  echo "nginx already installed, skipping."
else

  add-apt-repository ppa:nginx/stable --yes
  apt-get -y update
  apt-get -y install nginx

  mkdir -p /var/www/html/<%=@attributes.deploy_user%>/public
  chmod 755 /var/www
  mv files/nginx.conf /etc/nginx/sites-available/<%= @attributes.app_name %>

  sudo ln -s /etc/nginx/sites-available/<%= @attributes.app_name%> /etc/nginx/sites-enabled/<%= @attributes.app_name%>
  echo 'Webserver provisioned by sunzi is working' > /var/www/html/<%= @attributes.app_name%>/public/index.html
  service nginx restart
fi
