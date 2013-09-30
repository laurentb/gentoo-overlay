#!/bin/sh -eu
cd $(dirname $0)
FORCE_USECOLORS=true ./eix.sh \
    | ansi2html -a | sed 's/<a href/<a class="ansi40 ansi38-180" href/g'
