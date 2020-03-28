# postgresql

DISTRO="$(lsb_release -s -c)"

if apt search '~i ^postgresql-<%=@vars.postgres_version%>$' | grep -q postgresql; then
  echo "postgresql already installed, skipping."
else
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
  echo "deb http://apt.postgresql.org/pub/repos/apt/ $DISTRO-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list
  apt-get update -y
  apt-get -y install postgresql-<%= @vars.postgres_version %> libpq-dev

  if [ -f "/etc/postgresql/10/main/pg_hba.conf" ]; then
    echo "pg_hba.conf already exists"
    rm /etc/postgresql/10/main/pg_hba.conf
  fi

  #enable password authentication
  mv files/pg_hba.sample.conf /etc/postgresql/<%= @vars.postgres_version %>/main/pg_hba.conf
  chown postgres:postgres /etc/postgresql/<%= @vars.postgres_version %>/main/pg_hba.conf
  chmod 640 /etc/postgresql/<%= @vars.postgres_version %>/main/pg_hba.conf
  sudo service postgresql restart

  #create user and database
  sudo -u postgres psql -c "create user <%= @vars.postgres_user %> with password '<%= @vars.postgres_password %>';"
  sudo -u postgres psql -c "create database <%= @vars.postgres_database %> owner <%= @vars.postgres_user %>;"
fi
