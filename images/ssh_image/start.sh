!/bin/sh

/usr/sbin/syslog-ng -F -f /etc/syslog-ng/syslog-ng.conf &
sleep 5
/usr/sbin/sshd -D 2>&1 &
/bin/bash

