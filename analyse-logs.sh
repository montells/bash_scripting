#!/bin/bash

LOG_DIR="/home/montells/projects/bash_scripting/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="/home/montells/projects/bash_scripting/logs/report.txt"

echo "Analizing logs files" > $REPORT_FILE
echo "====================" >> $REPORT_FILE

echo -e "\nList of logs files updated in the last 24 hours" >> $REPORT_FILE
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES" >> $REPORT_FILE

for LOG_FILE in $LOGS_FILES; do
    echo -e "\n" >> $REPORT_FILE
    echo "===================================================" >> $REPORT_FILE
    echo "${LOG_FILE}" >> $REPORT_FILE
    echo "===================================================" >> $REPORT_FILE
    for ERROR_PATTERN in ${ERROR_PATTERNS[@]}; do
        echo -e "\nSearching $ERROR_PATTERN logs in $LOG_FILE file" >> $REPORT_FILE
        grep "$ERROR_PATTERN" "$LOG_FILE" >> $REPORT_FILE

        echo -e "\nNumber of $ERROR_PATTERN logs found in $LOG_FILE" >> $REPORT_FILE
        grep -c "$ERROR_PATTERN" "$LOG_FILE" >> $REPORT_FILE
    done
done

echo -e "\nLog analysis completed. Report saved to $REPORT_FILE"