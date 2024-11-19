#!/usr/bin/env python3
import os

dir_path = os.path.dirname(os.path.realpath(__file__))

# Finding monitor-res and turning it into a list
display = open(f"{dir_path}/temp/monitor-res", "r").read().split()
display = [int(num) for num in display]

x_axis = display[0] - 10

y_axis = display[1] - 10
    
print(x_axis, y_axis)