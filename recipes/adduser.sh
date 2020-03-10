#add deploy user

if [ -d /home/<%= @attributes.deploy_user %> ]; then
  echo "User already created skipping"
else
  useradd <%= @attributes.deploy_user %> -m -s /bin/bash
  mkdir -p /home/<%= @attributes.deploy_user %>/.ssh
  mv files/deploy_key /home/<%= @attributes.deploy_user %>/.ssh/authorized_keys
  chown -R <%= @attributes.deploy_user %>:<%= @attributes.deploy_user %> /home/<%= @attributes.deploy_user %>/.ssh
  #chown <%= @attributes.deploy_user %>:<%= @attributes.deploy_user %> /etc/nginx/sites-available/<%=@attributes.app_name%>
  chmod 400 /home/<%= @attributes.deploy_user %>/.ssh/authorized_keys
fi
