#!/bin/sh -eu
cd $(dirname $0)
FORCE_USECOLORS=true ./eix.sh \
    | ./ansi2html.sh --palette=tango \
    | sed 's#\(https\?://[^ ]\+\)#<a href="\1">\1</a>#g'
