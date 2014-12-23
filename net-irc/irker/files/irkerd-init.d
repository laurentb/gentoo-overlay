#!/sbin/runscript
# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

PIDFILE=/run/${SVCNAME}.pid

start() {
    OPTIONS=""
    [ -n "${USERNAME}" ] && OPTIONS="${OPTIONS} -n ${USERNAME}"
    [ -n "${PASSWORD}" ] && OPTIONS="${OPTIONS} -p ${PASSWORD}"
    [ -n "${LOGFILE}" ] && OPTIONS="${OPTIONS} -l ${LOGFILE}"
    ebegin "Starting ${SVCNAME}"
    start-stop-daemon --start --background --exec /usr/bin/irkerd \
        --pidfile ${PIDFILE} --make-pidfile \
        --user nobody:nobody \
        -- ${OPTIONS}
    eend $?
}

stop() {
    ebegin "Stopping ${SVCNAME}"
    start-stop-daemon --stop --pidfile ${PIDFILE}
    eend $?
}
