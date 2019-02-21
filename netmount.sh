ADMIN="youremail@email.com"
mount="/your/folder/mountpoint"
ip="$(/sbin/ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"

if grep -qs "$mount" /proc/mounts; then
  echo "$mount mounted already."
else
  echo "Mounting $mount ...."
   mount -t cifs -o soft,timeo=300,username=yourusername,password=yourpassword //youripaddresshere/networkdrivefolderpathhere $mount

if [ $? -eq 0 ]; then
   echo "Mount $mount success!"
  else
   echo "Unable to mount $mount partition"
   mail -s "Unable to mount $mount in $HOSTNAME ($ip) server" $ADMIN < /root/warning.txt
  fi
fi

exit 0;
