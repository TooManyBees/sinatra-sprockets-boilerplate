PIDFILE='tmp/pids/unicorn.pid'

echo "Starting Unicorn..."
if [[ $RACK_ENV == "production" ]]; then
  DAEMONIZE='-D'

  if [ -a $PIDFILE ]; then
    PID=$(cat $PIDFILE)
    echo "drinking $PID's blood to sustain my own twisted life"
    kill $PID
  fi

  rake assets
fi

unicorn -c config/unicorn.rb $DAEMONIZE

if [[ -n $DAEMONIZE && $? == 0 ]]; then
  PID=$(cat $PIDFILE)
  echo 'daemonized on process id '$PID
fi
