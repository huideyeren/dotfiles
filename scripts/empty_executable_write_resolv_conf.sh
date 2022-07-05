#!/bin/sh
TMP_FILE_NAME="tmp_resolve.conf"

if [ -f $TMP_FILE_NAME ]; then
  rm $TMP_FILE_NAME
fi
touch $TMP_FILE_NAME

# sh のバッチファイル実行上から powershell が見えなかったので、絶対パス指定
#POWERSHELL_COMMAND="/mnt/c/Windows/System32/WindowsPowerShell/v1.0//powershell.exe"
#NAMESERVER=$($POWERSHELL_COMMAND ipconfig | grep "IPv4" | tail -1 | awk '{print $NF}' | awk 'sub(/\r$/,"")')
NAMESERVER=$@

echo "# created by script, $(date "+%Y/%m/%d %H:%M:%S")" >> $TMP_FILE_NAME
echo "nameserver $NAMESERVER" >> $TMP_FILE_NAME
if [ $# != 0 ]; then
  echo "search $@" >> $TMP_FILE_NAME
fi

cat $TMP_FILE_NAME
mv $TMP_FILE_NAME /etc/resolv.conf
