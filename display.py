#!/usr/bin/env python3

from subprocess import run
import os

dir_path = os.path.dirname(os.path.realpath(__file__))

# Finding monitor-res and turning it into a list
display = open(f"{dir_path}/temp/monitor-res", "r").read().split()
display = [int(num) for num in display]

def x():
    x_axi = None
    for index in range(0, 1):

        if x_axi == None:
            x_axi = display[index] - 10

    return x_axi

def y():
    y_axi = None
    for index in range(1, 2):
        display = open(f"{dir_path}/temp/monitor-res", "r").read().split()
        display = [int(num) for num in display]

        if y_axi == None:
            y_axi = display[index] - 10

    return y_axi
    
print(x(), y())