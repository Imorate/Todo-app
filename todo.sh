#!/bin/bash
action=$1
shift

function add_action {
    echo "0,$2,\"$1\"" >>tasks.csv
}

function list_action {
    echo "list"
}

function done_action {
    echo "done"
}

function find_action {
    echo "find"
}

function clear_action {
    echo "clear"
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
done) done_action ;;
find) find_action ;;
clear) clear_action ;;
*)
    echo "Invalid action"
    exit 2
    ;;
esac
