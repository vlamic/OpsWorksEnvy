cron "data backup" do
  hour "#{node[:data_backup]["BACKUP_SCHEDULE_HOUR"]}"
  minute "#{node[:data_backup]["BACKUP_SCHEDULE_MINUTE"]}"
  weekday "#{node[:data_backup]["BACKUP_SCHEDULE_WEEKDAY"]}"
  command "rm -rf dump && " + 
  			"for COL in $BACKUP_COLLECTIONS; do mongoctl dump $BACKUP_SRC_DB -c $COL; done && " +
  			"mongoctl restore $BACKUP_DST_DB dump/beta --drop"
end
