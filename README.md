OpsWorksEnvy
==================

### environment_variables

Set environment variables for your environment and Node.js OpsWorks project.

You can do 2 things:
* Sets environment variables for machine
	* To make it work specify your variables, enable Custom Chef Recipes and include "environment_variables::configure" recipe to the "configure" section of your application layer
* Sets environment variables for Node.js process
	* Same as above, but no need to include custom recipe's; Default OpsWorks monitrc file will be overwritten and environment variables will be passed to Node.js process

To set environment variables specify custom Chef JSON with required key/value pairs.

E.g. 
```json
{
  "environment_variables": {
    "NODE_ENV": "production"
  },
  "deploy": { 
    "app_name": {
      "environment_variables": {
        "NODE_ENV": "production",
        "ENV_1": "value_of_env_1",
        "ENV_2": "value_of_env_2"
      }
    }
  }
}
```

In JSON above first "environment_variables" sets environment variables for machine (user root).
The section "environment_variables" under "deploy" specifying environment variables for Node.js process which will be hit with "monit restart app_name".

### data_backup

The utility to run backup on the certain interval. Currently supports MongoDB only. Data is being written from one database to another. Example scenario: data from production database is copied to development database every week.

Database options are set through environment variables.
Available options:
* BACKUP_TMP_PATH - the temporary location on the disk where backup will be performed
* BACKUP_SRC_DB_NAME - the name of the source database
* BACKUP_DST_DB_NAME - the name of the source database
* BACKUP_COLLECTIONS - space separated list of collections to backupo
* BACKUP_SRC_HOST - connection string for MongoDB SOURCE host
* BACKUP_DST_HOST - connection string for MongoDB DESTINATION host 

Schedule is set through custom JSON:
* BACKUP_SCHEDULE_HOUR - which our to run the tool
* BACKUP_SCHEDULE_MINUTE - which minute to run the tool
* BACKUP_SCHEDULE_WEEKDAY - which day of the week to run the tool
Default is: run backup every saturday at 1AM

Custom Chef cookbook JSON example:
```json
{
	"data_backup": {
		"BACKUP_SCHEDULE_HOUR": "16",
		"BACKUP_SCHEDULE_MINUTE": "0",
		"BACKUP_SCHEDULE_WEEKDAY": "2"
	},
	"environment_variables": {
		"BACKUP_TMP_PATH": "/tmp/dump",
		"BACKUP_SRC_DB_NAME": "my_mega_database",
		"BACKUP_DST_DB_NAME": "my_dev_database",
		"BACKUP_COLLECTIONS": "users shops streets",
		"BACKUP_SRC_HOST": "mongodb://my_super_production_database",
		"BACKUP_DST_HOST": "mongodb://my_not_as_super_development_database"
	}
}
```
