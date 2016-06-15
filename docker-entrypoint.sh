#!/bin/bash

if ! [ -f backup ]
then
  echo "Creating cron entry to start backup at: $BACKUP_TIME"
  # Note: Must use tabs with indented 'here' scripts.
  cat <<-EOF >> backup
	MYSQL_ENV_MYSQL_USER=$MYSQL_ENV_MYSQL_USER
	MYSQL_ENV_MYSQL_DATABASE=$MYSQL_ENV_MYSQL_DATABASE
	MYSQL_ENV_MYSQL_PASSWORD=$MYSQL_ENV_MYSQL_PASSWORD
	$BACKUP_TIME backup
	EOF
  crontab backup
fi

echo "Current crontab:"
crontab -l

exec "$@"
