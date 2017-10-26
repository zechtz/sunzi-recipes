if aptitude search '~i ^nodejs$' | grep -q nodejs; then
  echo "nodejs already installed, skipping."
else
  apt-get -y update
  apt-get -y install nodejs
  apt-get -y install npm
  #service nginx start
fi
