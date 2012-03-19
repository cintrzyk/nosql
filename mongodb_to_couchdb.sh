#! /bin/bash
clear

function helpme() {
  echo "/--------------- HELP ---------------------------------"
  echo "USAGE:"
  echo ""
  echo "[PORT] basename collection file_name"
  echo ""
  echo "EXAMPLE: "
  echo "27017 facebook friends contacts.json"
  echo "------------------------------------------------------/"
  exit 1
}

if [ $# -eq 4 ]; then
  port=$1
  shift
fi

: ${port:=27017}

if [ $# -ne 3 ]; then
  helpme
  exit 1
else
 mongoexport -d $1 -c $2 -o $3 --host localhost:$port
 echo ""
 echo "Data export from Mongodb to $3 [file] success!"
 echo ""
 echo "Please specify the port on which the Couchdb server is running: "
 read port_couchdb
 ruby script.rb $3 $2 $port_couchdb
 echo ""
 exit 0
fi
