#!/bin/env python3

# This build script is very primitive. It's just enough to piece together
# the various XML files that make up the policy and to place them in to
# a single XML document.

from jinja2 import Environment, FileSystemLoader

# Render the main XML file in memory
env = Environment(loader=FileSystemLoader("./"))
t = env.get_template("example.xml")
xccdf = t.render()

with open("example-xccdf.xml", "w") as f:
    f.write(xccdf)
