#!/sbin/runscript
# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

PIDFILE=/var/run/${SVCNAME}.pid

depend() {
    need net
}

start() {
    ebegin "Starting ${SVCNAME}"
    start-stop-daemon --start --background --exec /usr/bin/irkerd \
        --pidfile ${PIDFILE} --make-pidfile \
        --user irker:irker
    eend $?
}

stop() {
    ebegin "Stopping ${SVCNAME}"
    start-stop-daemon --stop --pidfile ${PIDFILE}
    eend $?
}
