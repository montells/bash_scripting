#!/bin/bash

echo "Analizing logs files"
echo "===================="

LOG_DIR="/home/montells/projects/bash_scripting/logs"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo -e "\nList of logs files updated in the last 24 hours"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES"

for LOG_FILE in $LOGS_FILES; do
    for ERROR_PATTERN in ${ERROR_PATTERNS[@]}; do
        echo -e "\nSearching $ERROR_PATTERN logs in $LOG_FILE file"
        grep "$ERROR_PATTERN" "$LOG_FILE"

        echo -e "\nNumber of $ERROR_PATTERN logs found in $LOG_FILE"
        grep -c "$ERROR_PATTERN" "$LOG_FILE"
    done
done