cron "puzzle data backup" do
  hour "15"
  minute "0"
  weekday "2"
  command "rm -rf dump && " + 
  			"for COL in $COLLECTIONS; do mongoctl dump $SRC_DB -c $COL; done && " +
  			"mongoctl restore $DST_DB dump/beta --drop"
end
