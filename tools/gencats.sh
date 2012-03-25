#!/bin/bash -eu
cd $(dirname $0)/..
rmdir --ignore-fail-on-non-empty -p *-*/* *-* # clean empty directories
ls -d *-* > ./profiles/categories
