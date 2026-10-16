#!/bin/bash
exit=0

until [ $exit -eq 1 ]; do
    clear
    echo "Linux System Menu"
    echo "1. Exit"
    echo "2. System version"
    echo "3. Uptime "
    echo "4. CPU usage"
    echo "5. Memory usage"
    echo "6. Disk usage"
    echo "7. System users"
    echo -e "8. Connectivity \n"
    read -p "Choose an option: " option
 
    case $option in
        1)
            exit=1
            break;
            ;;
        2)  
            cat /etc/os-release  | grep "PRETTY"
            ;;
        3)
            uptime | cut -d ',' -f1
            ;;
        4)
	    sysver=1
	    read -p "Press 2 if your system is like RedHat(2), Debian is default:" sysver

	    if [ "$sysver" == 2 ]; then
	    	top -b -n 1 | grep ^%Cpu | cut -d ',' -f1
    	    else
            	top -b -n 1 | grep ^%CPU | cut -d ',' -f1
    	    fi
            ;;
        5)
            free -h
            ;;
        6)
            df -h
            ;;
        7)
            tail -n10 /etc/passwd | grep "home"
            ;;
        8)
            ip a | grep "inet"
            ;;

        *)
            echo "Invalid option, please try again."
            ;;
    esac

    read -p "Press enter to continue..."
done
