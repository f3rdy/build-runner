#!/bin/bash

Xvfb :99 &
export DISPLAY=:99 

/bin/bash
