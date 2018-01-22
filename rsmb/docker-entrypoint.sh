#!/bin/sh

IP_ADDRESS=$(ping -c1 mosquitto | head -n1|cut -d " " -f3|tr -d "():")
echo "Connecting to ${IP_ADDRESS}"
cat > /broker_mqtts.conf <<EOF
listener 2883 INADDR_ANY mqtts

connection mqtts
	protocol mqtt
	try_private false
	address ${IP_ADDRESS}:1883
	topic #
EOF

exec /broker_mqtts /broker_mqtts.conf
