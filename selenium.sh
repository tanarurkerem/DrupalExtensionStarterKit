#!/usr/bin/env bash
PIDFILE=bin/selenium/selenium.pid
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
  echo "Selenium stoped"
elif [ x"$1" = xupdate ]; then
  cd bin/selenium
  curl -o list http://selenium-release.storage.googleapis.com/
  actualversion=$(grep -o "[0-9.]*/selenium-server-standalone-[0-9]*\\.[0-9]*\\.[0-9]*\\.jar" list|tail -n 1)
  curl -O http://selenium-release.storage.googleapis.com/$actualversion
  mv selenium-server-* selenium-server.jar
  rm list
  cd ../..
else
  echo "Usage: selenium.sh start|stop"
  echo ""
  if test -f "$PIDFILE"; then
    echo "Selenium is running"
  else
    echo "Selenium is not running"
  fi
fi
