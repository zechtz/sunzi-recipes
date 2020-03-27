# Seamlessly provision your sever using these recipes

## Getting started
You must first have ruby installed in your machine, then install the sunzi gem by running the following command
```gem install sunzi```

Next, Set up root user in your server and make sure you add your ssh key so that root can log in without a password or just  allow root login by editing the /etc/ssh/sshd_config file and setting the
```PermitRootLogin yes```

## Compile sunzi recipes by running the following command
```sunzi compile```

## Deploy and Install 
```sunzi deploy your_ip-address/domain-name```

Sunzi will copy the compiled files into your server and run the install.sh script

Check out the recipes directory to see what's available
