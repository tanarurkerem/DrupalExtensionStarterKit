curl -sS https://getcomposer.org/installer | php
php composer.phar install
if [ ! -d "$DIRECTORY" ]; then
  mkdir -p bin/selenium
  cd bin/selenium
  wget http://selenium.googlecode.com/files/selenium-server-standalone-2.35.0.jar
  mv selenium-server* selenium-server.jar
  cd ../..
fi
