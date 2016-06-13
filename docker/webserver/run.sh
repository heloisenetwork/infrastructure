#!/bin/sh

# change this line to rewrite docker-cache

# execute config script
chmod +x /config/config-run.sh
/config/config-run.sh

# give php write access to www directory
chown www-data /var/www

#clone files if /var/www is empty

DIR="/var/www"
# init
# look for empty dir 
if [ "$(ls -A $DIR)" ]; then
     echo "$DIR is not Empty"
else
    echo "$DIR is Empty: Clone Webserver Repository"
    # clone and update heloise-webserver
    git clone https://github.com/heloisenetwork/webserver.git $DIR/webserver
    cd $DIR && git pull
    git clone https://github.com/heloisenetwork/search-interface.git $DIR/search-interface
    cd $DIR && git pull
fi

# start the php5-fpm service
echo "starting php …"
service php5-fpm start

# start the nginx service
echo "starting nginx …"
service nginx start

echo "Here is the Webserver...!"
echo ""
echo "following log:"

LOG="/var/log/webserver.log"
touch $LOG
chmod a+w $LOG
tail -f $LOG
