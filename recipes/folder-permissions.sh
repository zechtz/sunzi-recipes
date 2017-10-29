if [ -d "/var/www/html/<%=@attributes.app_name%>/shared" ]; then
  echo "Shared directory already exists"
else
  echo "Creating shared directory"
  mkdir /var/www/html/<%=@attributes.app_name%>/shared
  chmod -R 775 /var/www/html/<%=@attributes.app_name%>/shared
fi

if [ -d "/var/www/html/<%=@attributes.app_name%>/storage" ]; then
  echo "Shared directory already exists"
else
  echo "Creating storage directory"
  mkdir /var/www/html/<%=@attributes.app_name%>/storage
  chmod -R 775 /var/www/html/<%=@attributes.app_name%>/storage
fi

echo "Changing ownership for www directory"
chown <%= @attributes.deploy_user %>:<%= @attributes.deploy_user %> /var/www/

echo "Recursively Changing ownership for html directory"
chown -R <%= @attributes.deploy_user %>:www-data /var/www/html
