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
else
  echo "Usage: selenium.sh start|stop"
  echo ""
  if test -f "$PIDFILE"; then
    echo "Selenium is running"
  else
    echo "Selenium is not running"
  fi
fi
