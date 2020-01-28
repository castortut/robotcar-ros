#!/bin/bash

set -euo pipefail

docker run --rm -d --name roscore \
    -v /ros:/ros --net host \
	ros-oma roscore
