# add deploy user
if [ -d /home/<%= @vars.deploy_user %> ]; then
  echo "User already created skipping"
else
  sudo useradd <%= @vars.deploy_user %> -m -s /bin/bash
  mkdir -p /home/<%= @vars.deploy_user %>/.ssh
  mv files/deploy_key.sample /home/<%= @vars.deploy_user %>/.ssh/authorized_keys
  sudo chown -R <%= @vars.deploy_user %>:<%= @vars.deploy_user %> /home/<%= @vars.deploy_user %>/.ssh
  sudo chmod 400 /home/<%= @vars.deploy_user %>/.ssh/authorized_keys
fi
