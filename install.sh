#!/bin/bash
set -e

# Load base utility functions like sunzi.mute() and sunzi.install()
source recipes/sunzi.sh

# This line is necessary for automated provisioning for Debian/Ubuntu.
# Remove if you're not on Debian/Ubuntu.
export DEBIAN_FRONTEND=noninteractive

# Add Dotdeb repository. Recommended if you're using Debian. See http://www.dotdeb.org/about/
# source recipes/dotdeb.sh
# source recipes/backports.sh

# Update apt catalog and upgrade installed packages
sunzi.mute "apt-get update"
sunzi.mute "apt-get -y upgrade"

source recipes/build-essential.sh
source recipes/git.sh
source recipes/nginx.sh
source recipes/set_permission.sh
source recipes/nodejs.sh
source recipes/install_php.sh
#source recipes/postgres.sh
source recipes/redis.sh
source recipes/adduser.sh
source recipes/ufw.sh
source recipes/sudonopassword.sh
source recipes/install-composer.sh
source recipes/folder-permissions.sh
source recipes/install_phantomjs.sh
