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
