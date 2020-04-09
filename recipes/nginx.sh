if apt search '~i ^nginx$' | grep -q nginx; then
  echo "nginx already installed, skipping."
else

  #cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

  if [ -f "/etc/apt/sources.list.d/nginx.list" ]; then
    echo "Source file already exists"
  else
    echo "Adding source file"
    mv files/nginx.list /etc/apt/sources.list.d/
  fi

  wget http://nginx.org/keys/nginx_signing.key

  sudo apt-key add nginx_signing.key

  sudo apt update -y

  sudo apt install nginx -y

  if [ -f "/etc/nginx/conf.d/portal.conf" ]; then
    echo "portal.conf file already exists"
  else
    mv files/proxy.sample.conf /etc/nginx/conf.d/<%= @vars.app_name %>.conf
  fi
fi
