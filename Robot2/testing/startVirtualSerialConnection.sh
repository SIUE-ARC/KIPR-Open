#!/bin/bash

sudo socat -d -d -d -d  PTY,link=/dev/ttyVirtualS0,echo=0 PTY,link=/dev/ttyVirtualS1,echo=0
