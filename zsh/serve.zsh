function serve() {
  echo "Scan open port 8888…8899"
  for (( PORTNUMBER = 8888; PORTNUMBER < 8899; PORTNUMBER++ )); do
    # Test si port dispo
    PDISPO=`netstat -an | grep $PORTNUMBER | grep -i listen | wc -l | awk '{print $1}'`
    if [ $PDISPO -eq 0 ]
      then
        echo "Open port found : $PORTNUMBER"
        python3 -m http.server $PORTNUMBER
        break
    fi
  done
}
