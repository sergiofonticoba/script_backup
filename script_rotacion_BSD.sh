#!/bin/sh

MES_ACTUAL=$(date +%m-%Y)

DIRECTORIO="/var/backups"
SALIDA="/var/backups/mensuales/respaldo.tar"

if [ ! -d  "$DIRECTORIO/mensuales" ]; then
        mkdir "$DIRECTORIO/mensuales"
fi
if [ -f "$SALIDA" ]; then
        newsyslog -f /etc/newsyslog.conf.d/copias.conf
        rm -rf "$SALIDA"
fi

tar cf "$SALIDA" $(find "$DIRECTORIO" -maxdepth 1 -type f -name "*${MES_ACTUAL}*") > /dev/null 2>&1; then