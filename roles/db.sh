# Install Database Server

# source recipes/mongodb-10gen.sh           # MongoDB
# apt-get -q -y install mysql-server-5.5    # MySQL 5.5 - You may need to enable Dotdeb in install.sh first
# apt-get -y install redis-server           # Redis - You may need to enable Dotdeb in install.sh first


if aptitude search '~i ^redis-server$' | grep -q redis; then
  echo "Redis already installed, skipping."
else
  apt-get -y install redis-server           # Redis - You may need to enable Dotdeb in install.sh first
fi
