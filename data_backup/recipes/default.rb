cron "puzzle data backup" do
  hour "$BACKUP_SCHEDULE_HOUR"
  minute "$BACKUP_SCHEDULE_MINUTE"
  weekday "$BACKUP_SCHEDULE_WEEKDAY"
  command "rm -rf dump && " + 
  			"for COL in $BACKUP_COLLECTIONS; do mongoctl dump $BACKUP_SRC_DB -c $COL; done && " +
  			"mongoctl restore $BACKUP_DST_DB dump/beta --drop"
end
