#!/usr/bin/env python3
from subprocess import run

display = ""

for variable in range(3):
    variable = (f"{variable}")
    display=run("stty size | xargs | cut -d ' ' -f" + variable)

print(display)