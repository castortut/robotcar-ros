#!/usr/bin/env python3

import rospy
from std_msgs.msg import Int32MultiArray
from sensor_msgs.msg import Joy

def callback(data):
    x = (data.axes[0] + 1) / 2
    y = (data.axes[1]/5 + 1) / 2

    x = 1 - x
    y = 1 - y

    pwm_steer = 3500 + x * (6100 - 3500)
    pwm_thr = 2800 + y * (7600 - 2800)

    # trim
    pwm_thr = pwm_thr + 300

    print(pwm_thr)

    arr = Int32MultiArray()
    arr.data = [-1] * 16
    arr.data[0] = pwm_thr
    arr.data[1] = pwm_steer
    global pwm_control
    pwm_control.publish(arr)

def test():
    rospy.init_node('test', anonymous=True)
    global pwm_control
    pwm_control = rospy.Publisher('/pwm/command', Int32MultiArray)
    rospy.Subscriber('/joystick/input', Joy, callback)
    rospy.spin()

if __name__ == '__main__':
    test()
