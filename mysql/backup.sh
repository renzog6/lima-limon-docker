#!/bin/bash

# Database credentials
DB_HOST="mysql"
DB_USER="limag6"
DB_PASS="resconi.843"
DB_NAME="lima_limon"

# Backup directory
BACKUP_DIR="/var/backups"

# Date format for the backup file
DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.sql.gz"

# MySQL dump command
MYSQL_DUMP="mysqldump --single-transaction -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME | gzip > $BACKUP_FILE"

# Execute the backup command
eval $MYSQL_DUMP

# Check if backup file exists
if [ -f "$BACKUP_FILE" ]; then
    echo "Database backup created successfully: $BACKUP_FILE"

    # Email subject
    SUBJECT="Database Backup - $DATE"

    # Email body
    BODY="Attached is the backup file for the database."

    # Email recipient
    RECIPIENT="your_email@example.com"

    # Send email with the backup file as an attachment
    echo -e "Subject:$SUBJECT\n\n$BODY" | (cat - && uuencode $BACKUP_FILE backup.sql.gz) | ssmtp $RECIPIENT
else
    echo "Error creating database backup."
fi
