#!/bin/sh

# copy Theme
cp -R /config/theme/heloise /var/www/extensions/themes/
ln -s /var/www/extensions/themes/silverblue/sandbox /var/www/extensions/themes/heloise/sandbox
ln -s /var/www/extensions/themes/silverblue/scripts /var/www/extensions/themes/heloise/scripts

echo 'themes.default = "heloise"' >> /var/www/config.ini
# set  extension
cp /config/extensions/*.ini /var/www/extension/

# copy news rss-feed
cp /config/IndexController.php /var/www/application/controllers/
