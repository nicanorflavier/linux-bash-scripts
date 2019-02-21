ADMIN="youremail@email.com"
mount="/media/usb"

ip="$(/sbin/ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"

if grep -qs "$mount" /proc/mounts; then
  echo "$mount mounted already."
else
  echo "Mounting $mount ...."
       mount /dev/sdb1 $mount
  if [ $? -eq 0 ]; then
   echo "Mount success!"
  else
   echo "Unable to mount $mount partition"
   mail -s "Unable to mount $mount external USB drive in $HOSTNAME ($ip) server" $ADMIN < /root/scripts/usb-warning.txt
  fi
fi
exit 0;
