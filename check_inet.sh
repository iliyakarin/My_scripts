#!/bin/bash

TMP_FILE=/tmp/inet_up

# Edit this function if you want to do something besides reboot
no_inet_action() {
    reboot 'No internet.'
}

if ping -c5 google.com; then
    echo 1 > $TMP_FILE
else
    [[ `cat $TMP_FILE` == 0 ]] && no_inet_action || echo 0 > $TMP_FILE
fi
