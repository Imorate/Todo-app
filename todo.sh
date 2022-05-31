#!/bin/bash
action=$1
shift

function add_action {
    echo "add"
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
add) add_action ;;
list) list_action ;;
done) done_action ;;
find) find_action ;;
clear) clear_action ;;
*)
    echo "Invalid action"
    exit 2
    ;;
esac
