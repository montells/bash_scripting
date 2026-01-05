#!/bin/bash

echo "Analizing logs files"
echo "===================="

LOG_DIR="/home/montells/projects/bash_scripting/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo -e "\nList of logs files updated in the last 24 hours"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES"

echo -e "\nSearching ERROR logs in applicaton.log file"
grep "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of ERROR logs found in application.log"
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of FATAL logs found in application.log"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of FATAL logs found in system.log"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nNumber of CRITICAL logs found in system.log"
grep -c "${ERROR_PATTERNS[2]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nCRITICAL logs in system.log file"
grep "${ERROR_PATTERNS[2]}" "$LOG_DIR/$SYS_LOG_FILE"