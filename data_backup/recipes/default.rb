cron "data backup" do
  hour "16"
  minute "30"
  weekday "2"
  command "rm -rf dump && " + 
  			"for COL in $BACKUP_COLLECTIONS; do mongoctl dump $BACKUP_SRC_DB -c $COL; done && " +
  			"mongoctl restore $BACKUP_DST_DB dump/beta --drop"
end
