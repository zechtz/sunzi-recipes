# install git
if aptitude search '~i ^git-core$' | grep -q git-core; then
  echo 'git-core already installed, skipping.'
else
  apt-get -y install git-core
fi
