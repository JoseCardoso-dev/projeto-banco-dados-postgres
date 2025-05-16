# Dê permissão de execução para o script de backup:

```bash
chmod +x backup_full.sh
```

# Edite o crontab:

```bash
crontab -e
```

# E adicione (backup todo domingo às 3h):

```bash
0 3 * * 0 /var/lib/postgresql/backups/backup_full.sh >> /var/log/backup.log 2>&1
```
