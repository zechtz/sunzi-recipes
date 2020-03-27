#set up rails specific environment variables
DEPLOY_HOME_PATH=/home/<%= @vars.deploy_user%>
DEPLOY_ENV_FILE_PATH=$DEPLOY_HOME_PATH/.<%= @vars.app_name %>_env
if [ -e $DEPLOY_ENV_FILE_PATH ]; then
  echo "env already set, skipping."
else

	mv files/env_vars $DEPLOY_ENV_FILE_PATH
	chown <%= @vars.deploy_user%>:<%= @vars.deploy_user%> $DEPLOY_ENV_FILE_PATH
	chmod 600 $DEPLOY_ENV_FILE_PATH
	echo "source ~/.<%= @vars.app_name %>_env" >> $DEPLOY_HOME_PATH/.bashrc
fi
