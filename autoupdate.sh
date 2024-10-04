while [ 1 ]
do
  H=`date '+%H'`
  if [ $H -eq "03" ]; then
    sh update.sh
  fi
  sleep 3600
done
