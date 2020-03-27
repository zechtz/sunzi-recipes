if apt search '~i ^nodejs$' | grep -q nodejs; then
  echo "nodejs already installed, skipping."
else
  add-apt-repository -y -r ppa:chris-lea/node.js
  rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list
  rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list.save
  rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.li
  curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
  VERSION=node_10.x
  DISTRO="$(lsb_release -s -c)"
  echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list
  apt-get -y update
  apt-get -y install nodejs
  # apt-get install nodejs-legacy
  # apt-get -y install npm
  npm install pm2 -g
fi
