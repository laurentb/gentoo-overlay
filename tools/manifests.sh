#!/bin/sh
cd $(dirname $0)/..
PORTDIR_OVERLAY=$PWD find -name '*.ebuild' -exec ebuild '{}' digest ';'
