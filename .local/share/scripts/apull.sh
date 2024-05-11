#!/bin/bash

set -e

adb pull /data/local/tmp/"$@"
