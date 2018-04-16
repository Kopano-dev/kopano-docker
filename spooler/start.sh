#!/bin/bash

set -eu # unset variables are errors & non-zero return values exit the whole script

mkdir -p /kopano/data/attachments /tmp/spooler /var/run/kopano

echo "Configure spooler" | ts
/usr/bin/python3 /kopano/configure.py

echo "Set config ownership" | ts
chown -R kopano:kopano /kopano/data /run /tmp

echo "Clean old pid files and sockets" | ts
rm -f /var/run/kopano/*

exec /usr/sbin/kopano-spooler -F