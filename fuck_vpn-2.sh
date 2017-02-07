#magateway=$(ip route | grep defau | grep  dhcp | awk '{print $3}')
#magateway=$(ip route | grep defau |grep via| awk '{print $3}')
default_line=$(ip route | sed '2!d')
magateway=$(echo $default_line | awk '{print $3}')
device=$(echo $default_line | awk '{print $5}')
for i in $(seq 1 9;seq 11 126;seq 128 171;seq 173 191;seq 193 223;seq 225 239;seq 241 254); do net=$i.0.0.0; echo $net; sudo ip route add $net/8 via $magateway dev $device  metric 1;done
#192.168.X.X
#
for i in $(seq 0 167;seq 169 255); do net=192.$i.0.0; echo $net; sudo ip route add $net/16 via $magateway dev $device  metric 1;done
#172.16.0.0 à 172.31.255.255
for i in $(seq 32 255); do net=172.$i.0.0 ; echo $net; sudo ip route add $net/16 via $magateway dev $device  metric 1;done
