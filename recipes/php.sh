if aptitude search '~i ^php$' | grep -q nodejs; then
  echo "php already installed, skipping."
else
  apt-get install python-software-properties --yes
  add-apt-repository ppa:ondrej/php
  apt-get update -y
  apt-get install -y php5.6 php5.6-mcrypt php5.6-bcmath php5.6-gd php5.6-pdo php5.6-pdo_pgsql php5.6-pgsql
fi
