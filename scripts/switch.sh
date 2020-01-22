set wlan on
set wlan ssid $SSID
set wlan security-type none, WEP, WPA2, WPA/WPA2


delete interface LAN1_Switch
add switch name $SW_NAME
set switch LAN2_Switch add port LAN4

PS3=$'\n'"Please Select How Many DNS Servers You Need: "
options=("Single NTP Server" "Two NTP Servers" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Single NTP Server")
        echo "#NTP CONFIG:" >> $NAME-zerotouch.txt
        echo "set ntp active on" >> $NAME-zerotouch.txt
        echo "set ntp interval 15" >> $NAME-zerotouch.txt
        printf "\nWhat is the IP or HOSTNAME of the primary NTP Server?\n"
        read PRI_NTP
        echo "set ntp server primary $PRI_NTP" >> $NAME-zerotouch.txt
        echo
        break
            ;;
        "Two NTP Servers")
        echo "#NTP CONFIG:" >> $NAME-zerotouch.txt
        echo "set ntp active on" >> $NAME-zerotouch.txt
        echo "set ntp interval 15" >> $NAME-zerotouch.txt
        printf "\nWhat is the IP or HOSTNAME of the primary NTP Server?\n"
        read PRI_NTP
        printf "\nWhat is the IP or HOSTNAME of the Secondary NTP Server?\n"
        read SEC_NTP
        echo "set ntp server primary $PRI_NTP" >> $NAME-zerotouch.txt
        echo "set ntp server secondary $SEC_NTP" >> $NAME-zerotouch.txt
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
