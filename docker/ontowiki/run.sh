#!/bin/bash

CONFIG_ONTOWIKI=/var/www/config.ini
LOG_ONTOWIKI="/var/www/logs/ontowiki.log"

# execute config script
chmod +x /config/config-run.sh
/config/config-run.sh

# set Virtuoso password in ontowikis config.ini
sed -i "s/\(store.virtuoso.password\s*\)= \"dba\"$/\1= \"${VIRTUOSO_ENV_PWDDBA}\"/" ${CONFIG_ONTOWIKI}

# start the php5-fpm service
echo "starting php …"
service php5-fpm start

# start the nginx service
echo "starting nginx …"
service nginx start

echo "OntoWiki is ready to set sail!"
cat /ow-docker.fig
echo ""
echo "following log:"

touch $LOG_ONTOWIKI
chmod a+w $LOG_ONTOWIKI
tail -f $LOG_ONTOWIKI
