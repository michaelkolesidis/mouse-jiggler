#!/bin/bash

echo "mouse-jiggler 🐭"

_dev=$(ls -1 /dev/input/by-id/*event-mouse | tail -1)
[ -z "${_dev}" ] && echo "Cannot find mouse event device" && exit 1
echo "Using ${_dev}"
while [ true ]; do
    sleep ${1-30}
    /usr/bin/evemu-event ${_dev} --type EV_REL --code REL_X --value ${2-10} --sync
    /usr/bin/evemu-event ${_dev} --type EV_REL --code REL_X --value -${2-10} --sync
done
