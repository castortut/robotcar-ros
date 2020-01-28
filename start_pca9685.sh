#!/bin/bash

set -euo pipefail

docker rm -f rospca9685

docker run -d --name rospca9685 \
    --privileged -v /dev/i2c-1:/dev/i2c-1 \
    -v /ros:/ros --net host \
	ros-oma bash -c 'source /ros/workspace/devel/setup.bash; rosrun pwm_pca9685 pca9685_node command:=/pwm/command'
