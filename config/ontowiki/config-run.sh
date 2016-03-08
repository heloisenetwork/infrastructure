#!/bin/sh

# copy new header logo
cp /config/logo-ontowiki.png /var/www/extensions/themes/amsl/images/

# set  extension
cp /config/extensions/*.ini /var/www/extension/

# copy news rss-feed
cp /config/IndexController.php /var/www/application/controllers/
