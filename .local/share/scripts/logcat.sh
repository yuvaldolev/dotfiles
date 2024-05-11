#!/bin/bash

while true; do
    adb logcat "$@"
done
