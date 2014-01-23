curl -sS https://getcomposer.org/installer | php
php composer.phar install
if [ ! -d "bin/selenium" ]; then
  mkdir -p bin/selenium
  bash selenium.sh update
fi
