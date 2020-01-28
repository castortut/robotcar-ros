#!/bin/sh
set -eu

value=$1
values=$(python3 -c "print(', '.join(['$value']*16))")
echo $values
rostopic pub -1 /command std_msgs/Int32MultiArray "{data: [$values]}" 
#rostopic pub -1 /command std_msgs/Int32MultiArray {data: [3000, 3000, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]}
