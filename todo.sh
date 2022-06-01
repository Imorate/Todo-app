#!/bin/bash
action=$1
shift

file_name=tasks.csv

function add_action {
    echo "0,$2,\"$1\"" >>$file_name
}

function list_action {
    awk -F\, '{print NR" | "$1" | " $2 " | " $3}' $file_name
}

function done_action {
    sed -i "$1"s/0/1/ $file_name
}

function find_action {
    list_action | grep -i "$1"
}

function clear_action {
    truncate -s 0 $file_name
}

case "$action" in
add)
    option_title=title
    option_priority=L
    while [ -n "$1" ]; do
        case "$1" in
        -t | --title)
            if [ -z "$2" ]; then
                echo "Option -t|--title Needs a Parameter"
                exit 1
            fi
            option_title=$2
            shift
            shift
            ;;
        -p | --priority)
            case "$2" in
            L | l) option_priority=L ;;
            M | m) option_priority=M ;;
            H | h) option_priority=H ;;
            *) echo "Option -p|--priority Only Accept L|M|H" ;;
            esac
            shift
            shift
            ;;
        esac
    done
    add_action "$option_title" $option_priority
    ;;
list) list_action ;;
done) done_action "$1" ;;
find) find_action "$1" ;;
clear) clear_action ;;
*)
    echo "Command Not Supported!"
    exit 2
    ;;
esac
