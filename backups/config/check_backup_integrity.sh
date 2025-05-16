#!/bin/bash
BACKUP_DIR=/var/lib/postgresql/backups
LOG="/var/log/integridade.log"
echo "$(date) - Verificando backups" >> $LOG

find $BACKUP_DIR -name "*.sql" | while read arquivo; do
    if [ -s "$arquivo" ]; then
        echo "$arquivo OK" >> $LOG
    else
        echo "$arquivo CORROMPIDO OU VAZIO" >> $LOG
    fi
done
