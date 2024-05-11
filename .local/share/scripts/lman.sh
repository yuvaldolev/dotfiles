#!/bin/bash

set -e

if [[ 1 == $# ]]; then
  MANPAGE="$1"
  MANPAGE_PRETTY_NAME="$1"
elif [[ 2 == $# ]]; then
  MANPAGE="$2.$1"
  MANPAGE_PRETTY_NAME="$2($1)"
else
  echo "USAGE: $0 [section] <page>" 1>&2
  exit 1
fi

CONTENT=$(curl -sL "https://manpages.debian.org/stable/$MANPAGE.en.gz" \
  | groff -man -Tutf8 -rLL=$(($(tput cols)*90/100))n 2>/dev/null \
  | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")

if [[ "$CONTENT" == *"Not  Found  â  Debian Manpages"* ]]; then
    echo "man page not found: $MANPAGE_PRETTY_NAME" 1>&2
    exit 1
fi

echo "$CONTENT" | bat -l man
