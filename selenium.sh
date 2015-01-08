#!/usr/bin/env bash
PIDFILE=bin/selenium/selenium.pid
SELENIUM_URL=http://selenium-release.storage.googleapis.com
if [ x"$1" = xstart ]; then
  if test -f "$PIDFILE"; then
    echo "Selenium is already running"
    exit;
  fi
  ((nohup java -jar bin/selenium/selenium-server.jar 0<&- &> bin/selenium/selenium.log) & echo $! > "$PIDFILE")
elif [ x"$1" = xstop ]; then
  if ! test -f "$PIDFILE"; then
    echo "Selenium is not running"
    exit;
  fi
  kill `cat "$PIDFILE"`
  rm $PIDFILE
  echo "Selenium stopped"
elif [ x"$1" = xupdate ]; then
  cd bin/selenium
  actualversion=$(curl -s $SELENIUM_URL|grep -o "[0-9.]*/selenium-server-standalone-[0-9]*\\.[0-9]*\\.[0-9]*\\.jar"|tail -n 1)
  curl -O $SELENIUM_URL/$actualversion
  mv selenium-server-* selenium-server.jar
  cd ../..
else
  echo "Usage: selenium.sh start|stop|update"
  echo ""
  if test -f "$PIDFILE"; then
    echo "Selenium is running"
  else
    echo "Selenium is not running"
  fi
fi
