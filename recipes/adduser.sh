#add deploy user

if [ -d /home/<%= @attributes.deploy_user %> ]; then
  echo "User already created skipping"
else
  useradd <%= @attributes.deploy_user %> -m -s /bin/bash
  mkdir -p /home/<%= @attributes.deploy_user %>/.ssh
  ssh-keygen -b 2048 -t rsa -f /home/<%= @attributes.deploy_user %>/.ssh/id_rsa.pub -q -N ""
  mv files/deploy_key /home/<%= @attributes.deploy_user %>/.ssh/authorized_keys
  chown -R <%= @attributes.deploy_user %>:<%= @attributes.deploy_user %> /home/<%= @attributes.deploy_user %>/.ssh
  chmod 400 /home/<%= @attributes.deploy_user %>/.ssh/authorized_keys
  chown <%= @attributes.deploy_user %>:<%= @attributes.deploy_user %> /var/www/
  chown -R <%= @attributes.deploy_user %>:www-data /var/www/html/
fi
