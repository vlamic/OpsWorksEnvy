cron "data backup" do
	hour "#{node[:data_backup]["BACKUP_SCHEDULE_HOUR"]}"
	minute "#{node[:data_backup]["BACKUP_SCHEDULE_MINUTE"]}"
	weekday "#{node[:data_backup]["BACKUP_SCHEDULE_WEEKDAY"]}"
	command "rm -rf $BACKUP_TMP_PATH && " + 
				"for COL in $BACKUP_COLLECTIONS; do mongoctl dump $BACKUP_SRC_DB -c $COL -o $BACKUP_TMP_PATH; done && " +
				"mongoctl restore $BACKUP_DST_DB $BACKUP_TMP_PATH/$BACKUP_SRC_DB_NAME --drop"
end
