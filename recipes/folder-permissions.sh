if [ -d "/var/www/html/<%=@vars.app_name%>/shared" ]; then
  echo "Shared directory already exists"
else
  echo "Creating shared directory"
  mkdir -p /var/www/html/<%=@vars.app_name%>/shared
fi

echo "Changing ownership for www directory"
chown -R <%= @vars.deploy_user %>:<%= @vars.deploy_user %> /var/www/

