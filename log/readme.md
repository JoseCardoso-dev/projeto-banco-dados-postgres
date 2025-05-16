# Edite o crontab:

```bash
crontab -e
```

# Adicione ao crontab diário:

```bash
0 1 * * * /var/lib/postgresql/backups/check_backup_integrity.sh >> /integridade.log 2>&1
```
