#!/bin/bash

set -euo pipefail

docker rm -f rosjoy

docker run -d --name rosjoy \
    --privileged -v /dev/input/js0:/dev/input/js0 \
    -v /ros:/ros --net host \
	ros-oma rosrun joy joy_node joy:=/joystick/input joy/set_feedback:=/joystick/feedback
