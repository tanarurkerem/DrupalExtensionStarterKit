curl -sS https://getcomposer.org/installer | php
php composer.phar install
if [ ! -d "bin/selenium" ]; then
  mkdir -p bin/selenium
  cd bin/selenium
  curl -O http://selenium.googlecode.com/files/selenium-server-standalone-2.39.0.jar
  mv selenium-server* selenium-server.jar
  cd ../..
fi
