if apt search '~i ^redis-server$' | grep -q redis; then
  echo "Redis already installed, skipping."
else
  # Redis - You may need to enable Dotdeb in install.sh first
  apt-get -y install redis-server
fi
