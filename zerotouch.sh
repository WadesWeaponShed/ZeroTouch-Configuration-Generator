#!/bin/bash
PWD=$(pwd)

printf "\nWhat is the name of your device?\n"
read NAME
export NAME
echo

while true
do
PS3=$'\n'"Please enter your choice: "
options=("Configure Interface" "Configure DNS" "Configure DHCP" "Configure NTP" "Configure WLAN" "Configure Switch" "Configure Central Management" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Configure Interface")
            echo "you chose choice 1"
            break
            ;;
        "Configure DNS")
            sh $PWD/scripts/dns.sh
            echo
            break
            ;;
        "Configure DHCP")
            echo "you chose choice $REPLY which is $opt"
            break
            ;;
        "Configure NTP")
            sh $PWD/scripts/ntp.sh
            echo
            break
            ;;
        "Configure WLAN")
            echo "you chose choice $REPLY which is $opt"
            break
            ;;
        "Configure Switch")
            echo "you chose choice $REPLY which is $opt"
            break
            ;;
        "Configure Central Management")
            printf "\nWhat is the IP of the Central Managment Server?\n"
            read MGMT_IP
            printf "\nSet a SIC password"
            read SIC
            echo "#MGMT Config:" >> $NAME-zerotouch.txt
            echo "set security-management mode centrally-managed" >> $NAME-zerotouch.txt
            echo "set sic_init password $SIC" >> $NAME-zerotouch.txt
            echo "connect security-management mgmt-addr $MGMT_IP use-one-time-password true local-override-mgmt-addr true send-logs-to by-policy" >> $NAME-zerotouch.txt
            echo "fetch policy mgmt-ipv4-address $MGMT_IP" >> $NAME-zerotouch.txt
            echo
            break
            ;;
        "Quit")
        echo "Your config file is $NAME-zerotouch.txt"
        exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
done
