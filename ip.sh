#! /bin/bash

if [ $# -ne 1 ]; then
  echo "Provide exactly one argument eg. $0 argument"
  echo  
  exit 1
fi

VAR1=$1
#ip address regex 127.0.0.1
REGEX="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[[:digit:]]{1,3}"

if ! [[ $VAR1 =~ $REGEX ]]; then
   echo "No IP address provided."
   echo
   exit 2
fi

IP=${BASH_REMATCH[0]}

#find if ip address is reachable or not
ping -c2 $IP 1>/dev/null

if [[ $? -eq 0 ]]; then
   STATUS="REACHABLE"
else
   STATUS="NOT REACHABLE"
fi

echo "IP_STATUS : $IP ($STATUS)"
echo
