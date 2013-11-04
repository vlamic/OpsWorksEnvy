cron "data backup" do
	hour "#{node[:data_backup]["BACKUP_SCHEDULE_HOUR"]}"
	minute "#{node[:data_backup]["BACKUP_SCHEDULE_MINUTE"]}"
	weekday "#{node[:data_backup]["BACKUP_SCHEDULE_WEEKDAY"]}"
	command "rm -rf $BACKUP_TMP_PATH && mkdir $BACKUP_TMP_PATH && " + 
				"for COL in $BACKUP_COLLECTIONS; do /usr/local/bin/mongoctl dump $BACKUP_SRC_HOST/$BACKUP_SRC_DB_NAME -c $COL -o $BACKUP_TMP_PATH >> $BACKUP_TMP_PATH/info.log 2>&1; done && " +
				"/usr/local/bin/mongoctl restore $BACKUP_DST_HOST/$BACKUP_DST_DB_NAME $BACKUP_TMP_PATH/$BACKUP_SRC_DB_NAME --drop >> $BACKUP_TMP_PATH/info.log 2>&1"
end
