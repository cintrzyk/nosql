#! /bin/bash
clear

function helpme() {
  echo "/--------------- HELP ---------------------------------"
  echo "USAGE:"
  echo ""
  echo "[PORT] basename collection json_file_path"
  echo ""
  echo "EXAMPLE: "
  echo "27017 facebook friends $HOME/file.json"
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
  echo "mongoimport --port $port -d $1 -c $2 $3"
  mongoimport --port $port -d $1 -c $2 $3
  exit 0
fi


