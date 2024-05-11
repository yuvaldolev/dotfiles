#!/bin/bash

set -e

adb push "$@" /data/local/tmp/
