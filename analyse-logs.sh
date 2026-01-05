find . -name "*.log" -mtime -1

log_folder='logs'
grep "ERROR" $log_folder/application.log
grep -c "ERROR" $log_folder/application.log
grep -c "FATAL" $log_folder/application.log

grep -c "FATAL" $log_folder/system.log
grep -c "CRITICAL" $log_folder/system.log
grep "CRITICAL" $log_folder/system.log
