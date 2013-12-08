#!/bin/sh
cd $(dirname $0)/..
export EIX_LIMIT=0
export EIXRC=${PWD}/tools/eixrc
export EIX_CACHEFILE="${PWD}/tools/eix.db"
PORTDIR_OVERLAY="" eix-update -x "*portage*" -a "${PWD}" -o "${EIX_CACHEFILE}" -q
eix -c
echo
echo
echo
eix
rm "${EIX_CACHEFILE}"
