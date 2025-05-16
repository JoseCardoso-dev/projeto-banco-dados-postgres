#!/bin/bash

DATA=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR=/var/lib/postgresql/backups
ARQUIVO_BACKUP=$BACKUP_DIR/backup_full_$DATA.sql

docker exec meu-postgres pg_dump -U backup_user -F c -d meubanco > "$ARQUIVO_BACKUP"   