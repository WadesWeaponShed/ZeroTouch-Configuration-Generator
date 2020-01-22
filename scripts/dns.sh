PS3=$'\n'"Please Select How Many DNS Servers You Need: "
options=("Single DNS Server" "Two DNS Servers" "Three DNS Servers" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Single DNS Server")
        echo "#DNS CONFIG:" >> $NAME-zerotouch.txt
        printf "\nWhat is the IP of the Primary DNS Server?\n"
        read PRI_DNS
        echo "set dns primary ipv4-address $PRI_DNS" >> $NAME-zerotouch.txt
        break
            ;;
        "Two DNS Servers")
        echo "#DNS CONFIG:" >> $NAME-zerotouch.txt
        printf "\nWhat is the IP of the Primary DNS Server?\n"
        read PRI_DNS
        printf "\nWhat is the IP of the Secondary DNS Server?\n"
        read SEC_DNS
        echo "set dns primary ipv4-address $PRI_DNS secondary ipv4-address $SEC_DNS" >> $NAME-zerotouch.txt
        echo
        break
            ;;
        "Three DNS Servers")
        echo "#DNS CONFIG:" >> $NAME-zerotouch.txt
        printf "\nWhat is the IP of the Primary DNS Server?\n"
        read PRI_DNS
        printf "\nWhat is the IP of the Secondary DNS Server?\n"
        read SEC_DNS
        printf "\nWhat is the IP of the Tertiary DNS Server?\n"
        read TER_DNS
        echo "set dns primary ipv4-address $PRI_DNS secondary ipv4-address $SEC_DNS tertiary ipv4-address $TER_DNS" >> $NAME-zerotouch.txt
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
