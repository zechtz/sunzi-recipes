# Seamlessly provision your sever using these recipes

## Getting started
Set up root user in your server and make sure you add your ssh key so that root can log in without a password

Simply run ```sh sunzi deploy 'your_ip-address/domain-name'```
Sunzi will copy the rempiled files into your server and run the install.sh script

# What gets installed
- nodejs & npm
- php5.6
- postgres  (Postgres will get installed plus a user & database will be creeted, configurations in sunzi.yml)
- nginx (Nginx will be set with proper configuration for laravel)
- redis

Check out the recipes directory to see what's available
