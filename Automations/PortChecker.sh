!/bin/bash
########################
# Author: Mahendra S
# Purpose: to print detail of port usage in unix system
#######################
### get the user input for which port 
#set -x
#set -e
#set -o pipefail
LISTENER=''
PORT=''
PORT=$1
if [ $PORT != 'null' ]
then
LISTENER = `sudo netstat -tunlpa |grep -i $PORT |grep "LISTEN"`
if [ $LISTENER != '' ]
then
echo "Port $PORT Listening for process `sudo netstat -tunlpa |grep -i $PORT |grep "LISTEN"|awk '{print $7}'`"
  for i in `sudo netstat -tunlpa |grep -i $PORT|awk '{print $5}'`
  do
    echo "$PORT connects to $i"
  done
  for i in `sudo netstat -tunlpa |grep -i $PORT |awk '{print $6}'`
  do
   echo "$PORT has connection from $i"
  done
fi
