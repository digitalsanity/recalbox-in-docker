# Redirect all traffic from 127.0.0.1:5432 to 172.20.0.1:5432
# so any connection to Postgresql keeps working without any other modification.
# Requires the --privileged flag when creating container:

sysctl -w net.ipv4.conf.all.route_localnet=1
iptables -t nat -A OUTPUT -p tcp -s 127.0.0.1 --dport 18080 -j DNAT --to-destination 172.20.0.1:80
iptables -t nat -A POSTROUTING -j MASQUERADE

echo "Booting recalbox.."

/etc/init.d/rcS

# Wait 40 seconds to start monitoring
sleep 40

# Method 1
# busybox wait for process to exit
while (ps | grep bootexec | grep -v grep); do sleep 3; done

# Method 2
#pid=`pidof ...`
#echo "Waiting for $pid to exit."
# Wait for pid to finish before leaving
#while ps -p $pid > /dev/null; do sleep 5; done;

# Method 3
# Little hack to keep the container running in foreground
# tail -f /dev/null

echo "recalbox shutting down."
