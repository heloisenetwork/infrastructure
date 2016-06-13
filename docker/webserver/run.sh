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

PROJECT="webserver"
# Look for empty dir 
if [ "$(ls -A $DIR/$PROJECT)" ]; then
     echo "$DIR/$PROJECT is not Empty"
else
    echo "$DIR/$PROJECT is Empty: Clone Webserver Repository"
    # clone and update $PROJECT
    git clone https://github.com/heloisenetwork/$PROJECT.git $DIR/$PROJECT
    cd $DIR/$PROJECT && git pull
fi

PROJECT="search-interface"
# Look for empty dir 
if [ "$(ls -A $DIR/$PROJECT)" ]; then
     echo "$DIR/$PROJECT is not Empty"
else
    echo "$DIR/$PROJECT is Empty: Clone Webserver Repository"
    # clone and update $PROJECT
    git clone https://github.com/heloisenetwork/$PROJECT.git $DIR/$PROJECT
    cd $DIR/$PROJECT && git pull
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
